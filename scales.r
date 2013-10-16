library(ggplot2)
library(scales)
library(sqldf)

if (!('a' %in% ls())) {
  a <- sqldf('SELECT permitApplicationNumber, publicNoticeDate, expirationDate, acreage, longitude, latitude FROM application',
    dbname = 'applications.db')
}
a$publicNoticeDate <- as.Date(a$publicNoticeDate)

o1 <- function() {
  plot(acreage ~ publicNoticeDate, data = a)
}

o2 <- function() {
  plot(acreage ~ publicNoticeDate, data = a, axes = FALSE)
  axis(2, at = c(0, 500, 1000, 1500, 2000), labels = c('0','500','1,000','1,500','2,000'))
}

p1 <- ggplot(iris) + aes(x = Sepal.Width, y = Sepal.Length, color = Species) + geom_point()

p2 <- p1 + scale_x_continuous(labels = dollar) + scale_y_continuous(labels = comma)

p3 <- ggplot(a) + aes(x = publicNoticeDate, y = acreage) + geom_point()

p4 <- p3 + scale_y_log10('Acreage', labels = comma)

p5 <- p4 + scale_x_date('Date of public notice posting', labels = date_format('%B %Y'))

p6 <- p4 + scale_x_date('Date of public notice posting', breaks = date_breaks('3 months'), labels = date_format('%B %Y'))

p7 <- p3 + scale_y_log10('Acreage', labels = comma, breaks = log_breaks(base = 2))

p8 <- p3 + scale_y_continuous('Acreage', labels = comma, breaks = pretty_breaks(n = 9))
