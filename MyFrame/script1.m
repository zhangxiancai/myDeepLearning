
model=model([784 10 10]);
data=DataUtil.loadData();
train=train(model,data,0.0001);
testTrain=testTrain(train);
testTrain.trainSomeTimes(1000);
testTrain.drawCostMap()

fprintf('ʶ��28X28��д���ֵ�������ѵ�����...\n')
while true
fileName=input('������ͼƬ��ַ,���罫����ʶ��...\n-->','s');

x=DataUtil.changeOneImageToX(fileName);
y=testTrain.train.model.netWork(x);

res=[[0:9];y'];
fprintf('\n')
fprintf('-->�� %d �Ŀ�����Ϊ %1.4f \n',res);
end
