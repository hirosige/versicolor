#!/usr/bin/env bash
#
set -e

git_url="https://github.com/ryurock/versicolor.git"

#
# 必要なツール等の確認フィルター
#
requirement_tool_filter() {
    local command=""

    if ! which git >/dev/null 2>&1; then
        echo "gitがインストールされていません。gitをインストールしてください"
        exit
    fi

    # OSXの場合
    if [ `uname` = "Darwin" ]; then
        if ! which brew >/dev/null 2>&1; then
            echo "homebrewがインストールされていませんのでインストールを行います"
            ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
        fi
    fi

    if ! which vagrant >/dev/null 2>&1; then
        echo "vagrantがインストールされていません。http://downloads.vagrantup.com/tags/v1.3.1からvagrantをインストールしてください"
        exit
    fi

    command=$(vagrant plugin list | grep vagrant-vbguest | awk '{print $1}')

    if [ ! "${command}" = "vagrant-vbguest" ]; then
        echo "vagrant-vbguestプラグインがインストールされていませんのでインストールを行います"
        vagrant plugin install vagrant-vbguest
    fi

    command=$(vagrant plugin list | grep sahara | awk '{print $1}')

    if [ ! "${command}" = "sahara" ]; then
        echo "saharaプラグインがインストールがされていませんのでインストールを行います"
        vagrant plugin install sahara
    fi

    # Packerのインストール確認
    if ! which packer >/dev/null 2>&1; then
        brew tap homebrew/binary
        brew install packer
    fi
}

#
# 共有フォルダを作成するメソッド
#
mkdir_synced_folder() {
    local command=$(cat Vagrantfile | grep 'config.vm.synced_folder' | awk '{print $2}' | sed -e "s/,//g" | sed -e 's/"//g')

    if [ ! -e "${command}" ]; then
        mkdir -p "./${command}"
        touch "./${command}/.gitignore"
    fi
}

#
# 過去のboxを削除する
#
box_destroy() {
    local command=$(cat Vagrantfile | grep 'BOX_NAME =' | awk '{print $3}' | sed -e 's/"//g')

    if [ -e "~/.vagrant.d/boxes/${command}/virtualbox" ]; then
        rm -rf "~/.vagrant.d/boxes/${command}/virtualbox"
        echo "boxes deleted"
    fi
}


#
# main
#
requirement_tool_filter
git clone "${git_url}"
mkdir_synced_folder

vagrant destroy --force
box_destroy

packer build -only=virtualbox packer.json
