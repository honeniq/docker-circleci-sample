#!/bin/bash

# $IMAGE=�C���[�W��
# $IMAID=�C���[�WID
# $CONTAINER1=���R���e�i��
# $CONTAINER2=�V�R���e�i��
# $MESSAGE1 �C���[�W�ύX�Ȃ��̏ꍇ�̃��b�Z�[�W
# $MESSAGE2 �C���[�W�ύX����̏ꍇ�̃��b�Z�[�W

# �C���[�W�ύX���Ȃ��ꍇ��Status���b�Z�[�W
MESSAGE1="Status: Image is up to date for honeniq/docker-circleci-sample:latest"

# �C���[�W��
IMAGE="honeniq/docker-circleci-sample"

# ���R���e�i��
CONTAINER1=$(cat /tmp/latest)
echo $CONTAINER1

# �C���[�W�擾����Status���b�Z�[�W��ϐ��ɑ��
MESSAGE2=$(docker pull $IMAGE | grep Status)
echo Status is $MESSAGE2

# �C���[�WID���擾
IMAGEID=$(docker images | grep 'honeniq/docker-circleci-sample' | awk '{print $3}')
echo Image ID is $IMAGEID

# pull�R�}���h���s����Status���b�Z�[�W�����r
# ��v����ꍇ�͍ŐV�C���[�W�̂��߉������Ȃ�
  if [ ${#MESSAGE1} = ${#MESSAGE2} ]; then
      echo "image is latest"

# ��v���Ȃ��ꍇ�́A�����R���e�i���~���ĐV�K�R���e�i���N������
  else
  # �V�R���e�i���i�V�������t�ɍX�V�j
    date "+%Y%m%d_%H%M%S" > /tmp/latest
    CONTAINER2=$(cat /tmp/latest)
    echo $CONTAINER2

      docker stop $CONTAINER1
      docker run -d --name $CONTAINER2 $IMAGE
  fi