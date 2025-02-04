library(dplyr)

# Create an empty data frame
student_data <- data.frame(Name=character(), Math=numeric(), Science=numeric(), 
                           History=numeric(), Attendance=numeric(), stringsAsFactors=FALSE)

# Function to add a student
add_student <- function(name, math, science, history, attendance) {
  student_data <<- rbind(student_data, data.frame(Name=name, Math=math, Science=science, 
                                                  History=history, Attendance=attendance))
  cat("Student added.\n")
}

# Function to calculate averages
calculate_averages <- function() {
  student_data %>% mutate(Average = (Math + Science + History) / 3) %>% select(Name, Average)
}

# Function to identify low attendance
low_attendance <- function(threshold = 70) {
  student_data %>% filter(Attendance < threshold) %>% select(Name, Attendance)
}

# Function to generate a report
generate_report <- function() {
  avg_scores <- calculate_averages()  # Fix: Use correct function
  low_atten <- low_attendance(70)  # Fix: Correct function call
  report <- merge(avg_scores, low_atten, by = "Name", all = TRUE)
  report$Attendance[is.na(report$Attendance)] <- "Good"  # Better readability
  print(report)
}

# Menu-driven program
repeat {
  cat("\n1. Add Student  2. Generate Report  3. Exit\n")
  choice <- as.integer(readline("Choice: "))
  
  if (choice == 1) {
    add_student(readline("Name: "), as.numeric(readline("Math: ")), as.numeric(readline("Science: ")), 
                as.numeric(readline("History: ")), as.numeric(readline("Attendance: ")))
  } else if (choice == 2) generate_report()
  else if (choice == 3) break
  else cat("Invalid choice!\n")
}
