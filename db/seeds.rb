User.destroy_all
Treatment.destroy_all

print '///Creating 1 User...///'
val = User.create!(
  first_name: "Valentin",
  last_name: "Ferron",
  phone_number: "06 75 84 96 75",
  email: "val@orizon.co",
  password: "123123",
  role: 0,
  )
print "👶 "
print '///Created 1 User...///'

print '///Creating 1 Treatment...///'
traitement = Treatment.create!(
  name: "Traitement Test",
  main_purpose: "Objectif conformité",
  service_concerned: "Service de la mairie",
  )
print "👶 "
print '///Created 1 User...///'
