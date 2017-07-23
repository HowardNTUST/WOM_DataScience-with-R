
####################    1. loop funtion - apply�����������   ####################


######## 1.1 apply ########
#apply:�@�ӹ�Ʋնi���ΦC�B�⪺��ơC
#apply(X, MARGIN, FUN, ...)
#MARGIN = 1 �O�d�Ҧ����C(�Ĥ@�Ӻ���)�A�����Ҧ�����
#MARGIN = 2 �O�d�Ҧ�����(�ĤG�Ӻ���)�A�����Ҧ����C
#EX:�إ�matrix�A�ñN�x�}����ΦC�B��
thematrix<- matrix(1:9, nrow = 3)
#�C�@�檺�`�M�A��ؤ�k�i�o�@�˪����G
apply(thematrix, 2, sum)
colSums(thematrix)
#�C�@�C���`�M
apply(thematrix, 1, sum)
rowSums(thematrix)
#�p��C�@�C�Φ��`�M
rowMeans(thematrix)
colMeans(thematrix)


######## 1.2 lapply ########
#lapply:��C�����C�Ӥ����M�Ψ�ơA�^�ǵ��G�Hlist�e�{�C
#lapply(X, FUN, ...)
#EX:�إߦC���i��A�ñN�C�������x�}�i��[�`
theList<- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
lapply(theList, sum)


######## 1.3 sapply ########
#sapply:²�ƤFlapply()�����G�A�|�^�Ǥ@�ӥ]�t�Ҧ��������V�q�C
#sapply(X, FUN, ...)
#EX:�u�ΤW�@�ӨҤl
sapply(theList, sum)


######## 1.4 mapply ########
#mapply:��n�X��list�����C�Ӥ����M�Ωҫ��w����ơA�Olapply()���h�ܶq�����C
#mapply: (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
#��ƪ��ѼƼƶq�ܤ֭n����ǻ���mapply()���C�����ƶq
#EX:�إߨ�list�A�����露�����˴��O�_�ۦP
firstList <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), C = 1:5)
secondList <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 15:1)
mapply(identical, firstList, secondList)
#EX:�إߤ@��²�檺��Ƨ�U�������C���ƶq(����)�[�_�ӡA�����Ψ�list
simpleFunc <- function(x, y)
{
   NROW(x) + NROW(y)
}
mapply(simpleFunc, firstList, secondList)
mapply(simpleFunc, firstList, secondList, SIMPLIFY = TRUE, USE.NAMES = TRUE)
mapply(simpleFunc, firstList, secondList, SIMPLIFY = FALSE, USE.NAMES = FALSE)


######## 1.5 tapply ########
#tapply:�Otable apply()���Y�g�A���N�V�q���ѫ�i����w��ƫ�A�A���s�զX�C
#tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)
#INDEX�O�t�@�ӦV�q�A���׻P�Ĥ@�ӦV�q�ۦP�A�ΨӪ����Ĥ@�ӦV�q�����U�������O�ݩ���@��(�Ҧp:�ʧO)
#EX:�N�V�q���հ�������(���A�H���ܶq�B�����H���ܶq�B���Ȭ�1���A�H���ܶq)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
#��gl��Ʋ��ͤT��level, �C��level ����10��
f <- gl(3, 10)
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)
#�ϥ�range �p���[���Ȫ��d��
tapply(x, f, range)


######## 1.6 split ########
#split(�D�`�����):���Hx�ھ�f�i����աA�æ^��list�A�i�H��lapply�Msapply�X�ΡC
#split (x, f, drop = FALSE, ...)
#x�i�H�O vector, list, data frames
#�]�l�ܶqf�A�Q�Ψӫ��w���ժ������]level�^�A���Hx�ھ�f�i�����
#split�Ptapply�����A��split�L�k�p�ⷧ�A�έp�q
#split���H�i����ի�^�Ǥ@�ӦC���A�i��W�ߪ��ըϥ�lapply�Msapply
#EX:�N�V�q���հ�������(���A�H���ܶq�B�����H���ܶq�B���Ȭ�1���A�H���ܶq)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
split(x, f, drop = FALSE)
lapply(split(x, f), mean)
#����k�Ptapply�����G�ۦP�A�ϥ�tapply�۹���

#split�n�B:����������������H
#EX:�[���ƾڶ��A�[��Ž�q�����B�ū׵��b�@�Ӥ뤺��������
library(datasets)
head(airquality)
#��������աA�ϥ�colMeans�p�⤣�P���ܶq��������
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
#�N�C��²�Ʀ��x�}(�T���ܶq�������[���)�A�ñNNA����
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))




############################    2. Debugging Tools    ############################


######## 2.1 Diagnosing the problem ########
#'#1. message: ���E�_�T���A���i�����Ƶo�͡A�����|�����ƪ�����C
#'#2. warning: �O�@�ش��ܡA�N���۵o�ͤF�Y�ǥX�G�N�ƪ��Ʊ��A�����@�w�O�Ӱ��D�C
#EX:
log(-1)

#'#3. error: ���~�|�פ��ƪ�����A���~�T���O�q�Lstop��Ʋ��ͪ��C
#�T�ؤ����u��error�|�Ϩ�ư���B��C
#EX:
printmessage <- function(x) {
  if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)  
}
#'#4. invisible ����۰ʿ�X�����
printmessage(1)
printmessage(NA)

#'#5. condition: �W�z�T�ش��ܳ��O����A�i�ۦ�гy�t�@�ر���A���J���O���~�Bĵ�i�A�]���O�T���C




##### 2.2 Basic Tools & Using the Tools ####
#�椬�u��A�i�H�b����x�W�i��@�Ǿާ@�C
#'#1. traceback: ���|�L�Xfunction call stack�A�i�D�A�@�@�եΤF�X�Ө�ơA�H�ο��~�o�ͦb���C
#EX:
mean(Q)
traceback()
#�`�N!�b�X�{���~��n���W����traceback()�A�]�����u�൹�X�W�@�����檺���~�C

#'#2. debug: �A�n�����ǻ��@�Ө�Ƨ@���ѦҡA���аO�o��ơA�i�Jdebug�Ҧ��C
#debug()�`�O�q��Ƥ@�}�l�N�@���a�B��
#�C�������o��ƮɡA���|�Ȱ�����A���b�o��ƪ��Ĥ@��C

#'#3. browser: �A��b�N�X������a��ե�browser()�C
#browser()���A��b�N�X������a��}�l�A��Ʒ|�@���B�����Ӹ`�I�~�|����C
#EX:
debug(lm)
lm(y ~ x)
#���ƫ�n�A���_�ե�debug��������~�A�����|�۰ʭ״_���~

#'#4. trace: �����\�A�b��Ƥ����J�ոեN�X�A�H�קK�s���ƥ����A��ư��槹�A�����Y�i�C
#'#5. recover:�O�@�ӿ��~�B�z��ơA�L�ר�Ʀb����a��o�Ϳ��~�AR�|�����������|�����^�챱��x�C
#���|���b��ƥX�����a��A�ÿ�Xfunction call stack(���)���A�s��������ҡC
#EX:�ϥ�options�Nrecover�]�����~�B�z��
#�u�n�h�XR�A���|�����AR�]���|�O�s�C
options(error = recover)
read.csv("nosuchfile")


#'#6. �ոդu�㤣����N�A����ҡI
#���Ӧh��ҥN�X�g�o��ˡA�Ӥ��O�H�K�ᵹ�վA�u��A�������A��X���D�C