#!/bin/bash

# $IMAGE=イメージ名
# $IMAID=イメージID
# $CONTAINER1=旧コンテナ名
# $CONTAINER2=新コンテナ名
# $MESSAGE1 イメージ変更なしの場合のメッセージ
# $MESSAGE2 イメージ変更ありの場合のメッセージ

# イメージ変更がない場合のStatusメッセージ
MESSAGE1="Status: Image is up to date for honeniq/docker-circleci-sample:latest"

# イメージ名
IMAGE="honeniq/docker-circleci-sample"

# 旧コンテナ名
CONTAINER1=$(cat /tmp/latest)
echo $CONTAINER1

# イメージ取得時のStatusメッセージを変数に代入
MESSAGE2=$(docker pull $IMAGE | grep Status)
echo Status is $MESSAGE2

# イメージIDを取得
IMAGEID=$(docker images | grep 'honeniq/docker-circleci-sample' | awk '{print $3}')
echo Image ID is $IMAGEID

# pullコマンド実行時のStatusメッセージ数を比較
# 一致する場合は最新イメージのため何もしない
  if [ ${#MESSAGE1} = ${#MESSAGE2} ]; then
      echo "image is latest"

# 一致しない場合は、既存コンテナを停止して新規コンテナを起動する
  else
  # 新コンテナ名（新しい日付に更新）
    date "+%Y%m%d_%H%M%S" > /tmp/latest
    CONTAINER2=$(cat /tmp/latest)
    echo $CONTAINER2

      docker stop $CONTAINER1
      docker run -d --name $CONTAINER2 $IMAGE
  fi