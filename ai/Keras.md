## Keras

### 优化器

##### 梯度下降

- BGD(Batch Gradient Descent)

> 更新规则：BGD 采用整个训练集的数据来计算 cost function 对参数的梯度

> 缺点：在一次更新中，就对整个数据集计算梯度，所以计算起来非常慢，遇到很大量的数据集也会非常棘手，而且不能投入新数据实时更新模型。

> Batch gradient descent 对于凸函数可以收敛到全局极小值，对于非凸函数可以收敛到局部极小值。

- SGD(Stochastic Gradient Descent)

> SGD 每次更新时对每个样本进行梯度更新，SGD 一次只进行一次更新，就没有冗余，而且比较快，并且可以新增样本。

> 缺点：SGD的噪音较BGD要多，使得SGD并不是每次迭代都向着整体最优化方向**。**所以虽然训练速度快，但是准确度下降，并不是全局最优**。**虽然包含一定的随机性，但是从期望上来看，它是等于正确的导数的。SGD 因为更新比较频繁，会造成 cost function 有严重的震荡。

- MBGD(Mini-Batch Gradient Descent)

> MBGD 每一次利用一小批样本，即 n 个样本进行计算，这样它可以降低参数更新时的方差，收敛更稳定，另一方面可以充分地利用深度学习库中高度优化的矩阵操作来进行更有效的梯度计算。和 SGD 的区别是每一次循环不是作用于每个样本，而是具有 n 个样本的批次。

### 卷积层

### core层

- Dense层
- Activation层
- Dropout层
- Flatten层
- Reshape层
- Permute层
- RepeatVector层
- Lambda层
- ActivityRegularizer层
- Masking层
- ​