## 验证yolov3的模型 [mAP](https://github.com/Cartucho/mAP)
> qwe实现的那个yolov3 [yolov3 qwe](https://github.com/qqwweee/keras-yolo3)
- 生成ground-truth文件
> 使用跟训练集txt一样格式的文件，可参考(https://github.com/yyf1986/mAP/blob/master/get_ground_truth.py)

> 注意修改成自己的类别

```
<class_name> <left> <top> <right> <bottom>
eye 286 271 356 307
eye 377 284 451 320
mouth 290 382 415 437
nose 319 329 395 379
chin 299 432 394 484
```

- 生成detection-results文件
> 将生成ground-truth文件的txt中的图片放到一个目录，可参考(https://github.com/yyf1986/mAP/blob/master/get_prefiel.py)

```
<class_name> <confidence> <left> <top> <right> <bottom>
chin 0.9435111880302429 314 434 400 488
nose 0.9888615608215332 321 325 394 377
mouth 0.5271587371826172 300 385 418 436
eye 0.9813078045845032 285 273 355 304
eye 0.9827172160148621 374 285 450 321
```

- 将图片拷贝到images目录下
- 执行python3.6 main.py
