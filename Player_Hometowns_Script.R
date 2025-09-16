```{r years, message=FALSE, include=FALSE}

# FIND OUT ISSUE

years_22_23 <- read_csv("years_22_23.csv")
years_23_24 <- read_csv("years_23_24.csv")
years_24_25 <- read_csv("years_24_25.csv")
years_25_26 <- read_csv("years_25_26.csv")

years_22_23$Season = 2023
years_23_24$Season = 2024
years_24_25$Season = 2025
years_25_26$Season = 2026

years <- bind_rows(
  years_22_23,
  years_23_24,
  years_24_25,
  years_25_26
) %>%
  separate(Hometown, into = c("Player_City", "Player_State"), sep = ", ", extra = "merge", fill = "right") %>%
  filter((!Pos %in% c("SP/RP", "SP", "RP", "p", "P")) & (!is.na(Player_City))) %>%
  mutate(Team = sub("\\s+\\S+$", "", Team),
         Jersey = as.numeric(Jersey),
         first_name = toupper(first_name), 
         last_name = toupper(last_name)) %>%
  reframe(Team, GP, Jersey, first_name, last_name, Yr, Bats, Player_City, Player_State, 
          Season) %>%
  mutate(Team = case_when(
    Team == "Southern Ind. Screaming" ~ "Southern Ind.",
    Team == "Western Ky. Lady" ~ "Western Ky.",
    Team == "UMass Lowell River" ~ "UMass Lowell",
    Team == "UAlbany Great" ~ "UAlbany",
    Team == "Tulsa Golden" ~ "Tulsa",
    Team == "Texas Tech Red" ~ "Texas Tech",
    Team == "Texas Southern Lady" ~ "Texas Southern",
    Team == "Tennessee St. Lady" ~ "Tennessee St.",
    Team == "Tennessee Tech Golden" ~ "Tennessee Tech",
    Team == "St. John's (NY) Red" ~ "St. John's (NY)",
    Team == "Southern U. Lady" ~ "Southern U.",
    Team == "Southern Miss. Golden" ~ "Southern Miss.",
    Team == "Southeastern La. Lady" ~ "Southeastern La.",
    Team == "South Carolina St. Lady" ~ "South Carolina St.",
    Team == "Rutgers Scarlet" ~ "Rutgers",
    Team == "Presbyterian Blue" ~ "Presbyterian",
    Team == "Prairie View Lady" ~ "Prairie View",
    Team == "Penn St. Nittany" ~ "Penn St.",
    Team == "Oakland Golden" ~ "Oakland",
    Team == "Notre Dame Fighting" ~ "Notre Dame",
    Team == "Northwestern St. Lady" ~ "Northwestern St.",
    Team == "North Texas Mean" ~ "North Texas",
    Team == "North Dakota Fighting" ~ "North Dakota",
    Team == "North Carolina Tar" ~ "North Carolina",
    Team == "Niagara Purple" ~ "Niagara",
    Team == "Nevada Wolf" ~ "Nevada",
    Team == "Morgan St. Lady" ~ "Morgan St.",
    Team == "Minnesota Golden" ~ "Minnesota",
    Team == "Middle Tenn. Blue" ~ "Middle Tenn.",
    Team == "Marshall Thundering" ~ "Marshall",
    Team == "Marist Red" ~ "Marist",
    Team == "Maine Black" ~ "Maine",
    Team == "Louisiana Ragin'" ~ "Lousiana",
    Team == "Louisiana Tech Lady" ~ "Louisiana Tech",
    Team == "Liberty Lady" ~ "Liberty",
    Team == "Lehigh Mountain" ~ "Lehigh",
    Team == "Kent St. Golden" ~ "Kent St.",
    Team == "Jackson St. Lady" ~ "Jackson St.",
    Team == "Hawaii Rainbow" ~ "Hawaii",
    Team == "Hampton Lady" ~ "Hampton",
    Team == "Grambling Lady" ~ "Grambling",
    Team == "Georgia Tech Yellow" ~ "Georgia Tech",
    Team == "Gardner-Webb Runnin'" ~ "Gardner-Webb",
    Team == "Florida A&M Lady" ~ "Florida A&M",
    Team == "ETSU Buccaneers" ~ "ETSU",
    Team == "Duke Blue" ~ "Duke",
    Team == "Delaware Blue" ~ "Delaware",
    Team == "DePaul Blue" ~ "DePaul",
    Team == "Dartmouth Big" ~ "Dartmouth",
    Team == "Cornell Big" ~ "Cornell",
    Team == "Central Conn. St. Blue" ~ "Central Conn. St.",
    Team == "Canisius Golden" ~ "Canisius",
    Team == "California Golden" ~ "California",
    Team == "Army West Point Black" ~ "Army West Point",
    Team == "Ark.-Pine Bluff Lady" ~ "Ark.-Pine Bluff",
    Team == "Arizona St. Sun" ~ "Arizona St.",
    Team == "Alcorn Lady" ~ "Alcorn",
    Team == "Alabama St. Lady" ~ "Alabama St.",
    Team == "IU Indy" ~ "IUPUI",
    Team == "Illinois Fighting" ~ "Illinois",
    Team == "Maryland Terrapins," ~ "Maryland",
    Team == "Alabama Crimson" ~ "Alabama",
    TRUE ~ Team))

# No Saint Francis, Texas A&M-Commerce, Evansville scraped from years

temp <- d1_pos %>%
  left_join(years, by = c("first_name", "last_name", "Season", "Yr", ncaa_university_name = "Team", "Jersey", "GP"))

temp %>%
  filter(is.na(Player_City)) %>%
  group_by(ncaa_university_name) %>%
  distinct() %>%
  count() %>%
  arrange(-n)



temp %>%
  filter(is.na(Player_City)) %>%
  reframe(ncaa_university_name, Player_City, Player_State)
```