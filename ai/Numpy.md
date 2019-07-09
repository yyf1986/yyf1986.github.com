### Numpy

- shape

> 返回数组维度

```python
import numpy as np
a = np.array([[1,2,3],[4,5,6]])
print a.shape
```

```
(2L, 3L)
```

- 调整数组维度

```
a = np.array([[1,2,3],[4,5,6]])
print a.shape
a.shape = (3,2)
print a
print a.shape
```

```
(2L, 3L)
[[1 2]
 [3 4]
 [5 6]]
(3L, 2L)
```

```
a = np.array([[1,2,3],[4,5,6]])
print a.shape
b = a.reshape(3,2)
print b
print b.shape
```

```
z = np.array([[1, 2, 3, 4],[5, 6, 7, 8]])
print z.shape
z = z.reshape(-1,1)
print z.shape
```

```
(2L, 4L)
(8L, 1L)
```

> -1我们不知道z的shape属性，只是想把它变成1列，行数自动计算

- argmax/agrmin

> 返回最大数，所在的下标/返回最小数，所在下标
>
> 0 所有数组都要进行比较，只是比较的是数组相同位置上的数
>
> 1 比较数组内的大小，结果也会根据几个数组，产生几个结果

```
test = np.array([[1, 2, 3], [2, 3, 4], [5, 4, 3], [8, 7, 2]])
print np.argmax(test)
print np.argmax(test,0)
print np.argmax(test, 1)
```

```
9
[3 3 1]
[2 2 0 0]
```

- ndim

> 返回是几维数组

```
a = np.array([[[1,2,3],[4,5,6],[4,5,6]]])
print a.ndim
a = np.array([[1,2,3],[4,5,6],[4,5,6]])
print a.ndim
```

```
3
2
```

- mean

> 求平均数

```
a = np.array([[1,2,3],[4,5,6]])
print np.mean(a)
```

```
3.5
```

- zeros

> 返回一个给定形状和类型的用0填充的数组

```
np.zeros(5)
```

```
array([ 0.,  0.,  0.,  0.,  0.])
```

### opencv

```
import cv2
image = cv2.imread('Image/6.jpg',0) #0 灰度 1 彩色 默认是1
cv2.namedWindow('image', 0) 
cv2.imshow('image', image) 
cv2.waitKey(0) 
```

```
import cv2
import matplotlib.pyplot as plt

image = cv2.imread('Image/6.jpg') #0 灰度 1 彩色  默认是1 BGR
image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) #不转，plt无法正常显示opencv打开的图片
plt.imshow(image)
plt.show()
```

> opencv以彩色图片加载的图片是BGR，matplotlib是以RGB

```
image = cv2.imread('Image/6.jpg',0) #0 灰度 1 彩色  默认是1 BGR
plt.imshow(image, cmap='gray')
plt.show()
```

> 有的时候opencv打开图片返回nonetype

```
frame = plt.imread('.//2018_05_25_22_17_32_652222_4117.jpg')
frame = cv2.cvtColor(frame,cv2.COLOR_RGB2BGR)
cv2.imshow("image",frame)
cv2.waitKey(0)
```

> plt打开图片，通过opencv转灰度

```
frame = plt.imread('.//2018_05_25_22_17_32_652222_4117.jpg')
frame = cv2.cvtColor(frame,cv2.COLOR_RGB2GRAY)
plt.imshow(frame,cmap='gray')
plt.show()
```

> opencv读入图片的矩阵格式是：height，width，channels，而在深度学习中，因为要对不同通道应用卷积，所以采用另外一种方法：channels，height，width

```
img = cv2.imread('1.jpg')
print img.shape
img = img.transpose(2,0,1)
print img.shape
```

