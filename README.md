# myDeepLearning
自己实践的深度学习的demo
备忘：

18/6/5 根据吴恩达深度学习教程，写了一个2层网络模型，和2层模型的负梯度下降法，用识别手写数字的数据，跑了一下程序。

18/6/20 /myFrame文件夹是我构建的一个深度学习小框架，

模型支持多层全连接神经网络模型，可更改层数和节点数，隐含层激活函数为RELU()，输出层为sigmoid（）.

训练算法用负梯度下降，还没有支持其他方法，

数据集的每一列指样本

使用实例（用28X28的识别手写数字数据为例）：

运行以下命令：

model=model([784 10 10]);%模型有一个输入层，一个隐含层，一个输出层。节点数分别为784 10 10

data=DataUtil.loadData();

train=train(model,data,0.0001);%0.0001为学习率，初值为0.001*rand（）

testTrain=testTrain(train);

testTrain.trainSomeTimes(1000);%训练1000次

testTrain.drawCostMap()%画出代价函数变化图


