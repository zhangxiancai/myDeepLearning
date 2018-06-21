
model=model([784 10 10]);
data=DataUtil.loadData();
train=train(model,data,0.0001);
testTrain=testTrain(train);
testTrain.trainSomeTimes(1000);
testTrain.drawCostMap()

fprintf('识别28X28手写数字的神经网络训练完成...\n')
while true
fileName=input('请输入图片地址,网络将进行识别...\n-->','s');

x=DataUtil.changeOneImageToX(fileName);
y=testTrain.train.model.netWork(x);

res=[[0:9];y'];
fprintf('\n')
fprintf('-->是 %d 的可能性为 %1.4f \n',res);
end
