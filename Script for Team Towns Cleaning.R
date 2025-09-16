d1_teams_towns <- read_csv("d1_teams_towns.csv")[-2] %>%
  mutate(City = gsub("^Division I -\\s*", "", City))

# All loops below indicate a university had missing values for city and/or state
for (i in 1:nrow(d1_teamstowns)) {
  if (d1_teamstowns$`Team Name`[i] == "McNeese") {
    d1_teamstowns$City[i] = "Lake Charles"
    d1_teamstowns$State[i] = "LA"
  } else if (d1_teamstowns$`Team Name`[i] == "UIW") {
    d1_teamstowns$City[i] = "San Antonio"
    d1_teamstowns$State[i] = "TX"
  } else if (d1_teamstowns$`Team Name`[i] == "Saint Francis") {
    d1_teamstowns$City[i] = "Loretto"
    d1_teamstowns$State[i] = "PA"
  } else if (d1_teamstowns$`Team Name`[i] == "UMES") {
    d1_teamstowns$City[i] = "Princess Anne"
    d1_teamstowns$State[i] = "MD"
  }
}

d2_teams_towns <- read_csv("d2_teams_towns.csv")[-2] %>%
  mutate(City = gsub("^Division II -\\s*", "", City))

for (i in 1:nrow(d2_teams_towns)) {
  if (d2_teams_towns$`Team Name`[i] == "Bloomfield") {
    d2_teams_towns$City[i] = "Bloomfield"
    d2_teams_towns$State[i] = "NJ"
  } else if (d2_teams_towns$`Team Name`[i] == "Emory & Henry") {
    d2_teams_towns$City[i] = "Emory"
  } else if (d2_teams_towns$`Team Name`[i] == "Kentucky St.") {
    d2_teams_towns$City[i] = "Frankfort"
  } else if (d2_teams_towns$`Team Name`[i] == "Limestone") {
    d2_teams_towns$City[i] = "Gaffney"
    d2_teams_towns$State[i] = "SC"
  } else if (d2_teams_towns$`Team Name`[i] == "Academy of Art") {
    d2_teams_towns$City[i] = "San Francisco"
    d2_teams_towns$State[i] = "CA"
  } 
}

d3_teams_towns <- read_csv("d3_teams_towns.csv")[-2] %>%
  mutate(City = gsub("^Division III -\\s*", "", City))

for (i in 1:nrow(d3_teams_towns)) {
  if (d3_teams_towns$`Team Name`[i] == "MUW") {
    d3_teams_towns$City[i] = "Columbus"
    d3_teams_towns$State[i] = "MS"
  } else if (d3_teams_towns$`Team Name`[i] == "William Peace") {
    d3_teams_towns$City[i] = "Raleigh"
    d3_teams_towns$State[i] = "NC"
  } else if (d3_teams_towns$`Team Name`[i] == "Carlow") {
    d3_teams_towns$City[i] = "Pittsburgh"
    d3_teams_towns$State[i] = "PA"
  } else if (d3_teams_towns$`Team Name`[i] == "Fontbonne") {
    d3_teams_towns$City[i] = "Clayton"
    d3_teams_towns$State[i] = "MO"
  } else if (d3_teams_towns$`Team Name`[i] == "SUNY Brockport") {
    d3_teams_towns$City[i] = "Brockport"
    d3_teams_towns$State[i] = "NY"
  } else if (d3_teams_towns$`Team Name`[i] == "SUNY Morrisville") {
    d3_teams_towns$City[i] = "Morrisville"
    d3_teams_towns$State[i] = "NY"
  } else if (d3_teams_towns$`Team Name`[i] == "Mount Mary") {
    d3_teams_towns$City[i] = "Milwaukee"
    d3_teams_towns$State[i] = "WI"
  }
}


write.csv(d1_teams_towns, "d1_teams_towns.csv", row.names = FALSE)
write.csv(d2_teams_towns, "d2_teams_towns.csv", row.names = FALSE)
write.csv(d3_teams_towns, "d3_teams_towns.csv", row.names = FALSE)
