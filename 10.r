df <- data.frame(
EMPID= c(101,102,103,104,105),
Name=c("John","peter","bob","Linda","Elizabeth"),
Age=c(25,30,35,40,45),
Salary=c(50000,60000,45000,70000,55000),
Department=c("HR","IT","Finance","Production","QualityControl"))
df2 <- data.frame(
EMPID =c(103,104,105),
Bonus=c(2000,3000,5000)
)

print("Filtered Data:")
print(df %>% filter(Age>25))
print("Selected Columns:")
print(df %>% select(EMPID, Name, Salary))
print("Mutated Data:")
print(df %>% mutate(Salary_Adjusted=Salary*1.1))
print("Summarized Data:")
print(df %>% group_by(Department) %>% summarize(Avg_salary=mean(Salary), Max_Age=max(Age)))
print("Arranged Data:")
print(df %>% arrange(Age, desc(Salary)))
print("Joined Data:")
print(left_join(df, df2, by="EMPID"))
