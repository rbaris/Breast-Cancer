# Makine Öğrenmesi ile Göğüs Kanseri Tespiti
  Göğüs kanseri dünya genelinde en yaygın görülen ikinci kanser türü olup kadınlar arasında
kanser kaynaklı en yüksek oranda ölüme sebep olan hastalıktır.Diğer tüm kanser türlerinde
olduğu gibi göğüs kanserinin de erken teşhisi ölüm oranını azaltmada kritik bir öneme sahiptir.
Göğüs kanseri tanısı, test sonuçların yorumlanarak teşhis edilmesi uzman insan bilgisine ihtiyaç
duymaktadır ancak gelişen makine öğrenmesi teknikleri ile göğüs kanseri teşhisinde başarılı
çalışmalar yürütülmektedir. Makine öğrenmesi bilgisayarların mevcut verilerden öğrenerek
karmaşık ve büyük veri setleri içerisindeki desenleri hızlı bir şekilde tespit etmesini sağlayan bir
yapay zekâ dalıdır. Bu yeteneğinden dolayı makine öğrenmesi kanser tanı ve teşhisinde özellikle
göğüs kanseri konusunda da yaygın kullanım alanı bulmaktadır. Bu çalışmada her biri 30 adet
özellik içeren ve 569 örnekten oluşan Wisconsin Üniversitesi göğüs kanseri veri seti, üç farklı
makine öğrenmesi tekniği ile sınıflandırılmıştır. Veriler rastgele olarak eğitim ve test setlerine
ayrılmıştır. K en yakın komşu, Naïve Bayes, karar ağacı ile gerçekleştirilen eğitim sürecinin
ardından confusion matrisleri ve roc eğrileri oluşturulmuştur. Her bir tekniğin başarısı
karşılaştırılmıştır. Bu karşılaştırmanın sonucunda k en yakın komşu %98.23 doğruluk ile en
başarılı yöntem olduğu ortaya konmuştur.


  Veriler %80 eğitim seti, %20 test seti olacak şekilde rastgele bölünerek beş farklı makine
öğrenmesi modeli ile sınıflanarak test edilmiştir. Naive Bayes (NB), K En Yakın Komşu
(K Nearest Neighbor – KNN) , Karar Ağacı(Decision Tree) sınıflayıcılarının başarıları
karşılaştırılmıştır. Modellerin oluşturulması ve test işlemleri MATLAB ile
gerçekleştirilmiştir.
  
  Veri seti kaggle üzerinden temin edilmiştir.
+ [Göğüs Kanseri veri seti](https://www.kaggle.com/datasets/yasserh/breast-cancer-dataset)


  Veriler arasındaki basamak farklılıklarından kaynaklı işlem kaymalarından olumsuz
etkilenmemek için veri seti normalize edilmiştir. Normalize edilirken iki farklı yöntem uygulanmıştır. ‘scale’ yönteminde karar kılındıktan sonra
projeye scale yöntemiyle devam edilmiştir.‘center’ yöntemi ile normalize ettikten sonra sayıların büyük ölçüde farklarını koruduğunu ve
eksi değerlerin oluşmasını farkettikten sonra bu yöntemden vazgeçilmiştir.
scale yönteminin varsayılan,'std' (default), seçenekleri kullanılmıştır. ‘scale’ yöntemi veriler arası
oranları koruduğu için ve eksi değerler döndürmediği için bu veri seti için daha uygun bulunmuştur.

Projenin tamamlandığı tarih: 07.12.2022


# Breast Cancer Detection with Machine Learning

Breast cancer is the second most common type of cancer worldwide and among women.
It is the disease that causes the highest rate of death from cancer. In all other types of cancer,
As with breast cancer, early detection of breast cancer has a critical importance in reducing the death rate.
Diagnosis of breast cancer, interpretation of test results and diagnosis requires expert human knowledge.
However, with the developing machine learning techniques, it is successful in diagnosing breast cancer.
studies are carried out. Machine learning allows computers to learn from existing data.
It is a tool that allows it to quickly detect patterns in complex and large data sets.
It is a branch of artificial intelligence. Because of this ability, machine learning is especially useful in cancer diagnosis and diagnosis.
It is also widely used in breast cancer. In this study, each of the 30
The University of Wisconsin breast cancer dataset, which includes features and consists of 569 samples, has three different
classified by machine learning technique. The data are randomly assigned to the training and test sets.
separated. The K nearest neighbor, Naïve Bayes, shows that the training process with the decision tree
Then, confusion matrices and roc curves were created. The success of each technique
have been compared. As a result of this comparison, k nearest neighbor is the most accurate with 98.23% accuracy.
proved to be a successful method.

The data were randomly divided into 80% training set and 20% test set, and five different machines.It was tested by classifying with the learning model. Naive Bayes (NB), K Nearest Neighbor(K Nearest Neighbor – KNN), achievements of Decision Tree classifiershave been compared. Creating and testing models with MATLAB has been carried out.
  
  The dataset was obtained from kaggle.
+ [Breast Cancer Dataset](https://www.kaggle.com/datasets/yasserh/breast-cancer-dataset)


  Negative effects of process shifts due to step differences between data. The data set has been normalized to avoid being affected.
In order not to be affected, the data set has been normalized. While normalizing, two different methods were applied. After deciding on the 'scale' method
The project continued with the scale method. After normalizing with the 'center' method, the numbers kept their differences to a large extent and
After noticing the formation of negative values, this method was abandoned. The default, 'std' (default), options of the scale method are used. 'scale' method between data. It was found more suitable for this data set as it preserves the ratios and does not return negative values.

Project completion date: 07.12.2022
