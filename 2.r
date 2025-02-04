num_students <- 10
num_courses <- 5
names <- c("John", "Anna", "Tim", "Harry", "Pal", "Jim", "Peter", "Bob", "Cook", "James")
marks <- matrix(c(
  85, 92, 78, 88, 95, 88, 89, 78,77,81,
  75, 80, 85, 70, 60, 90, 67, 70,89,87,
  100, 78, 56, 34, 56, 45, 78, 97,66,89,
  78, 45, 67, 89, 90, 56, 89, 67,99,98,
  89,80,67,78,90, 67, 78,90, 78, 78
), nrow=num_students, byrow=TRUE)  # Now 50 elements (10 × 5)

cat("\nStudent Grade Report:\n")
for (i in 1:num_students) {
  total <- sum(marks[i,])
  avg <- total / num_courses
  grade <- ifelse(avg >= 90, "A",
                  ifelse(avg >= 80, "B", 
                         ifelse(avg >= 70, "C", 
                                ifelse(avg >= 60, "D", "F"))))
  
  cat("\n", names[i], " | Marks:", paste(marks[i,]), " | Total:", total, " | Avg:", avg, " | Grade:", grade)
}
