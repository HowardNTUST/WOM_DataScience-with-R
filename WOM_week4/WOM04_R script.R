#str��ƥi�H�d�ݥ����ƪ����c�H�Υ������e�Ѽ�
str(str)
str(lm)
str(ls)
str(rnorm)
x <- rnorm(100,2,4)  #x���˥���100�����Ƭ�2�зǮt��4���`�A
summary(x) #�i�H�ݨ�x��min,max,Q1.2.3.
str(x)   #�i�H�]�X�e���ӼƦr�A���A���D�o�Ӥ��t�O�����
num [1:100]
#�C�ؤ��������H�U�|�ب��
rnorm(n, mean=0, sd=1) #�`�A���tn�˥�
dnorm(x ,mean=0, sd=1, log=FALSE) #(density)�p�G�w�g���D������зǮt���ܥi�H���D���v�K��
pnorm(q, mean=0, sd=1, lower.tail = ture) #�i�H�ݲֿn�����v(����)
qnorm(p, mean=0, sd=1, lower.tail = ture) #�i�H�ݤ����
#gamma�N��(dgamma,rgamma,pgamma,qgamma)
#pois(dpois,rpois,ppois,qpois)
rnorm(10)  #�˥���10���зǱ`�A
rnorm(20,10,2) #�˥�20������10�зǮt��2
rpois(10,1)  #�˥�10�����o�ͦ��Ƭ�1�����˪Q���t
rpois(10,2)
rpois(10,20)

#y=b0+b1x+e
set.seed(20)
x <-rnorm(100)
e <-rnorm(100,0,2)
y <- 0.5+2*x+e
summary(y)   #y�������ƬO0.68���k�A�d��b-6~6����
plot(x,y)

#sample function ��X����^
set.seed(1)
sample(1:10,4)
sample(letters, 5)   #�]�i�H��^��r��
sample(1:10)   #�H���ƦC�A�C�������@��
sample(1:10,replace=TRUE)   #���X��^
