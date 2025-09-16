years_23_24_1 <- read_csv("years_23_24.csv") # change with given file and years
years_23_24_1 <- rbind(names(years_23_24_1), years_23_24_1) %>%
  # For each of the below, the row names will be the first row
  # This is simply making column names for the first row and shifting all rows down 1
  rename(team_id = "571907",
         Team = "St. Thomas (MN) Tommies",
         GP = "5",
         GS = "4",
         Jersey = "6",
         name = "Loryn Barney",
         Yr = "Fr.",
         Pos = "UT",
         Height = "5-9",
         Bats = "LEFT...11",
         Throws = "LEFT...12",
         Hometown = "Lewiston, ID",
         `High School` = "Lewiston"
  ) %>%
  # Separate name into first and last name columns --> allows for easier join to CSE data
  separate(name, into = c("first_name", "last_name"), sep = " ", extra = "merge", fill = "right") %>%
  reframe(team_id, Team, GP, Jersey, first_name, last_name, Yr, Pos, Bats, Hometown) %>%
  mutate(Yr = case_when(
    Yr == "Fr." ~ "Freshman",
    Yr == "So." ~ "Sophomore",
    Yr == "Jr." ~ "Junior",
    TRUE ~ "Senior"
  ))

# By some ID (we chose name), make sure the first row is cleaned
# May have to add parameters below
for (i in 1:nrow(years_23_24_1)) {
  if (years_23_24_1$first_name[i] == "Loryn" & years_23_24_1$last_name[i] == "Barney") {
    years_23_24_1$Bats[i] = "LEFT"
  }
}

write.csv(years_23_24_1, "years_23_24_1.csv", row.names = FALSE)