data <- data.frame(
  Score = c(45, 50, 48, 52, 47, 60, 62, 58, 65, 61),
  Group = c("A","A","A","A","A","B","B","B","B","B")
)

str(data)

aggregate(Score ~ Group, data = data,
          FUN = function(x) c(
            Mean = mean(x),
            SD = sd(x),
            N = length(x)
          ))

shapiro.test(data$Score[data$Group == "A"])
shapiro.test(data$Score[data$Group == "B"])

var.test(Score ~ Group, data = data)

t.test(Score ~ Group, data = data)
t.test(Score ~ Group, data = data, var.equal = TRUE)

group_A <- data$Score[data$Group == "A"]
group_B <- data$Score[data$Group == "B"]

t.test(group_A, group_B)