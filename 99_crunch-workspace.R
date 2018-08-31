library(dplyr)
library(crunch)
library(haven)
library(fs)

data_dir <- "~/Dropbox/APSA Hackathon/hackathon-data/output/"

old_sav <- read_sav(path(data_dir, "2018-08-15_grad-hackathon_anon.sav"))
new_sav <- read_sav(path(data_dir, "2018-08-30_grad-hackathon_anon.sav"))

new_add <- new_sav %>% filter(EndDate > "2018-08-10 07:32:03 UTC")
write_sav(new_add, path(data_dir, "2018-08-30_add-on.sav"))





login()


ds <- loadDataset("Graduate Student APSA Hackathon Team Survey",
                  project = "APSA Hackathon")
forkDataset(ds)

dsf <- loadDataset("Fork of Graduate Student APSA Hackathon Team Survey")

newDataset("https://www.dropbox.com/s/buhr0fyqohgupk2/2018-08-30_add-on.sav?dl=0",
           name = "Add-on APSA Hackathon")

new <- loadDataset("Add-on APSA Hackathon")
appendDataset(dsf, new)


dsf <- loadDataset("Fork of Graduate Student APSA Hackathon Team Survey")
mergeFork(ds, dsf)
