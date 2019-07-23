### Dlib
#### 安装
- pip3.6 install dlib
- python3.6 setup.py install --yes USE_AVX_INSTRUCTIONS --yes DLIB_USE_CUDA
> AMD的cpu不支持dlib
#### 使用
###### 检测人脸
```
#!/usr/local/bin/python3.6
# -*- coding: utf-8 -*-

import dlib

detector = dlib.get_frontal_face_detector() # 默认的
#detector = dlib.simple_object_detector("detector.svm") # 自己训练的
#detector =  dlib.cnn_face_detection_model_v1("mmod_human_face_detector.dat") # cnn

img = dlib.load_rgb_image(imagefile)
dets = detector(img, 1) # 第2个参数upsample
#dets, scores, idx = detector.run(img, 1, 0)  # 自己训练的没有run函数
```
###### 检测68个特征点
```
#!/usr/local/bin/python3.6
# -*- coding: utf-8 -*-

import sys

import dlib
from imutils import face_utils

detector = dlib.get_frontal_face_detector()
shape_predictor = dlib.shape_predictor("shape_predictor_68_face_landmarks.dat")

img = dlib.load_rgb_image(imagefile)
dets = detector(img, 1)

if len(dets) == 0:
    print("no face")
    sys.exit()
    
for index, face in enumerate(dets):
    print('face {}; left {}; top {}; right {}; bottom {}'.format(index, face.left(), face.top(), face.right(), face.bottom()))
        
    shape = shape_predictor(img, face)   # 提取68个特征点
    points = face_utils.shape_to_np(shape) # 特征点转numpy.array
    # 后续可以对获取的68个点，进行操作，比如闭眼检测等，但是遮挡不可以
```
###### 获取人脸特征向量
###### 获取扶正后的脸
```
#!/usr/local/bin/python3.6
# -*- coding: utf-8 -*-

import sys

import dlib
from imutils import face_utils

detector = dlib.get_frontal_face_detector()
shape_predictor = dlib.shape_predictor("shape_predictor_68_face_landmarks.dat")

img = dlib.load_rgb_image(imagefile)
dets = detector(img, 1)

if len(dets) == 0:
    print("no face")
    sys.exit()
    
faces = dlib.full_object_detections()
for detection in dets:
    faces.append(shape_predictor(img, detection))


images = dlib.get_face_chips(img, faces, size=320)  # 多人脸
    
image = dlib.get_face_chip(img, faces[0]) # 单个人脸
    
dlib.save_face_chip(img, faces[0], "test")  # 保存人脸
    
```
#### 训练
###### 标注(imglab)
- git clone https://github.com/yyf1986/dlib.git
- 进到目录C:\dlib-master\tools\imglab
- 创建目录build
- cmd命令行进到C:\dlib-master\tools\imglab\build
- 执行命令cmake ..
- cmake --build . --config Release
- cmd进入到目录C:\dlib-master\tools\imglab\build\Release，创建images目录，该目录存放需要训练的图片
- imglab -c mydataset.xml images生成xml文件
- imglab mydataset.xml就会出现标注工具