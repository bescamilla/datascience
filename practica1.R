################ practica ###################

dataset_adult <- read_csv('~/datascience/adult.data')

colnames(dataset_adult) <- c('age',
                             'workclass',
                             'fnlwgt',
                             'education',
                             'education-num',
                             'marital-status',
                             'occupation',
                             'relationship',
                             'race',
                             'sex',
                             'capital-gain',
                             'capital-loss',
                             'hours-per-week',
                             'native-country', '50K')

dataset_adult <- as_tibble(dataset_adult)

hombres <- filter(dataset_adult, sex == "Male")

hombres

select(dataset_adult, age, education, 'native-country')

arrange(dataset_adult, "native-country")

arrange(dataset_adult, desc(age))


dataset_sexo_pais <- summarise(group_by(dataset_adult, sex, 'native-country'), count = n())
dataset_sexo_pais