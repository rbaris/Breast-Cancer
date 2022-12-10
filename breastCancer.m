clc; clear;

breast_cancer = readtable('data.csv');
breast_cancer = removevars(breast_cancer,{'id'});

breast_cancerNorm = normalize(breast_cancer,'scale',"DataVariables",vartype("numeric"));
c = breast_cancerNorm.diagnosis;
breast_cancerNorm.diagnosis = grp2idx(c);

% cancer tablosundaki 1 ler Malignant(kotu) 2 ler Benign(iyi huylu) bu sekilde
% ayrilmasinin sebebi ilk gelen veriyi 1 ikinci gelen benzersiz veriyi 2
% olarak gruplandirmasi grp2idx(c)

pt = cvpartition(breast_cancerNorm.diagnosis,"HoldOut",0.2);

bcTrain = breast_cancerNorm(training(pt),:);
bcTest = breast_cancerNorm(test(pt),:);

x_train = bcTrain(:,2:31);

y_train = bcTrain(:,1);					

x_test = bcTest(:,2:31);

y_test = bcTest(:,1);

YY = (bcTrain.diagnosis) == 1;
XX = (bcTest.diagnosis) == 1;
ZZ = (y_test.diagnosis) ==1;
testydouble = table2array(y_test);
AA = table2array(y_test);


knnmodel = fitcknn(bcTrain,YY,'Distance','euclidean','NumNeighbors',15);
[labelKNN,scoreKNN,costKNN] = predict(knnmodel,bcTest);
[Xlog,Ylog,Tlog,AUClog] = perfcurve(XX,scoreKNN(:,knnmodel.ClassNames),'true');

knnmodel2 = fitcknn(x_train,y_train,'Distance','cosine','NumNeighbors',15);
[labelknn_2,scoreknn_2,costknn_2] = predict(knnmodel2,x_test);
[Xknn2,Yknn2,Tknn2,AUCknn2] = perfcurve(testydouble,scoreknn_2(:,1),'1');

knnmodel3 = fitcknn(x_train,y_train,'Distance','euclidean','NumNeighbors',15);
[labelknn_3,scoreknn_3,costknn_3] = predict(knnmodel3,x_test);
[Xknn3,Yknn3,Tknn3,AUCknn3] = perfcurve(testydouble,scoreknn_3(:,1),'1');

knnmodel4 = fitcknn(x_train,y_train,'Distance','jaccard','NumNeighbors',15);
[labelknn_4,scoreknn_4,costknn_4] = predict(knnmodel4,x_test);
[Xknn4,Yknn4,Tknn4,AUCknn4] = perfcurve(testydouble,scoreknn_4(:,1),'1');

mdlDtree = fitctree(x_train,y_train,'PredictorSelection','curvature','Surrogate','all');
%Yfit = predict(mdlDtree,bcTest);
imp = predictorImportance(mdlDtree);

figure(1);

bar(imp,"green","EdgeColor","#000");
title('Özniteliklerin Tahminler Üzerindeki Etkisi');
ylabel('Tahminler',FontWeight='bold');
xlabel('Öznitelikler',FontWeight='bold');
h = gca;
h.XTickLabel = mdlDtree.PredictorNames;
h.XTickLabelRotation = 45;
h.TickLabelInterpreter = 'none';

view(mdlDtree,'Mode','graph')

mdlNBayes=fitcnb(x_train,y_train);
[labelNB,scoreNB,costNB] = predict(mdlNBayes,x_test);
testydouble = table2array(y_test);
[Xnb,Ynb,Tnb,AUCnb] = perfcurve(testydouble,scoreNB(:,1),'1');

figure(2)
plot(Xnb,Ynb,'DisplayName','Naive Bayes','LineWidth',1);
legend('Naive Bayes','KNN - Öklid Uzaklığı (?)','KNN - Kosinüs Uzaklığı','KNN - Öklid Uzaklığı','KNN - Jaccard Uzaklığı','Location','southeast')
hold on
plot(Xlog,Ylog,'DisplayName','KNN - öklid uzaklığı (?)');
plot(Xknn2,Yknn2,'DisplayName','KNN - kosinüs uzaklığı','LineWidth',1);
plot(Xknn3,Yknn3,'DisplayName','KNN - öklid uzaklığı','LineWidth',1);
plot(Xknn4,Yknn4,'DisplayName','KNN - jaccard uzaklığı','LineWidth',1);
hold off

figure(3)

cmNB = confusionchart(AA,labelNB,"Title",'Naive Bayes');
cmatrixNB = confusionmat(AA,labelNB)

TPnb = cmatrixNB(1,1);
TNnb = cmatrixNB(2,2);
FPnb = cmatrixNB(2,1);
FNnb = cmatrixNB(1,2);

Accuracynb = (TPnb+TNnb)/(TPnb+FPnb+FNnb+TNnb)
Recallnb = (TPnb)/(TPnb+FNnb);
PrecisionNB = (TPnb)/(TPnb+FPnb);
F1_scoreNB = 2*((PrecisionNB*Recallnb)/(PrecisionNB+Recallnb))

figure(4)

cmKNN1 = confusionchart(XX,labelKNN,'Title','KNN - Öklid Uzaklığı (?)');
cmatrixKNN1 = confusionmat(XX,labelKNN)

TPknn1 = cmatrixKNN1(1,1);
TNknn1 = cmatrixKNN1(2,2);
FPknn1 = cmatrixKNN1(2,1);
FNknn1 = cmatrixKNN1(1,2);

Accuracyknn1 = (TPknn1+TNknn1)/(TPknn1+FPknn1+FNknn1+TNknn1)
Recallknn1 = (TPknn1)/(TPknn1+FNknn1);
Precisionknn1 = (TPknn1)/(TPknn1+FPknn1);
F1_scoreknn1 = 2*((Precisionknn1*Recallknn1)/(Precisionknn1+Recallknn1))

figure(5)

cmKNN2 = confusionchart(AA,labelknn_2,"Title",'KNN - Kosinüs Uzaklığı');
cmatrixKNN2 = confusionmat(AA,labelknn_2)

TPknn2 = cmatrixKNN2(1,1);
TNknn2 = cmatrixKNN2(2,2);
FPknn2 = cmatrixKNN2(2,1);
FNknn2 = cmatrixKNN2(1,2);

Accuracyknn2 = (TPknn2+TNknn2)/(TPknn2+FPknn2+FNknn2+TNknn2)
Recallknn2 = (TPknn2)/(TPknn2+FNknn2);
Precisionknn2 = (TPknn2)/(TPknn2+FPknn2);
F1_scoreknn2 = 2*((Precisionknn2*Recallknn2)/(Precisionknn2+Recallknn2))

figure(6)

cmKNN3 = confusionchart(AA,labelknn_3,"Title",'KNN - Öklid Uzaklığı');
cmatrixKNN3 = confusionmat(AA,labelknn_3)

TPknn3 = cmatrixKNN3(1,1);
TNknn3 = cmatrixKNN3(2,2);
FPknn3 = cmatrixKNN3(2,1);
FNknn3 = cmatrixKNN3(1,2);

Accuracyknn3 = (TPknn3+TNknn3)/(TPknn3+FPknn3+FNknn3+TNknn3)
Recallknn3 = (TPknn3)/(TPknn3+FNknn3);
Precisionknn3 = (TPknn3)/(TPknn3+FPknn3);
F1_scoreknn3 = 2*((Precisionknn3*Recallknn3)/(Precisionknn3+Recallknn3))

figure(7)

cmKNN4 = confusionchart(AA,labelknn_4,"Title",'KNN - Jaccard Uzaklığı');
cmatrixKNN4 = confusionmat(AA,labelknn_4)

TPknn4 = cmatrixKNN4(1,1);
TNknn4 = cmatrixKNN4(2,2);
FPknn4 = cmatrixKNN4(2,1);
FNknn4 = cmatrixKNN4(1,2);

Accuracyknn4 = (TPknn4+TNknn4)/(TPknn4+FPknn4+FNknn4+TNknn4)
Recallknn4 = (TPknn4)/(TPknn4+FNknn4);
Precisionknn4 = (TPknn4)/(TPknn4+FPknn4);
F1_scoreknn4 = 2*((Precisionknn4*Recallknn4)/(Precisionknn4+Recallknn4))





