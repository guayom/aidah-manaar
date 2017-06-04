# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DancePlan.create(name: 'Plan HobbyAmateur 1 Vez por semana',lessons_per_week: 1,price: 21000.0,price_with_discount:18000.0, tuition: 18000.0,leveling: 27000.0, position: 1)
DancePlan.create(name: 'Plan HobbyAmateur 2 Veces por semana',lessons_per_week: 2,price: 30000.0,price_with_discount:27000.0, tuition: 18000.0, leveling: 32000.0, position: 2)
DancePlan.create(name: 'Plan HobbyAmateur 3 Veces por semana',lessons_per_week: 3,price: 35000.0,price_with_discount:32000.0, tuition: 18000.0, leveling: 0, position: 3)
DancePlan.create(name: 'Plan HobbyAmateur  Veces Ilimitadas', lessons_per_week: 0,price: 58000.0,price_with_discount:55000.0, tuition: 18000.0, leveling: 27000.0, position: 6)
DancePlan.create(name: 'Plan Profesional.', lessons_per_week: 0,price: 37000.0,price_with_discount:33000.0, tuition: 20000.0, leveling: 38000.0, position: 7)
DancePlan.create(name: 'Plan Profesional Quinto Año', lessons_per_week: 0,price: 44800.0, price_with_discount: 0, tuition: 20000.0, leveling: 0, position: 8)
DancePlan.create(name: 'Clase adicional.',lessons_per_week: 1,price: 7000.0, price_with_discount: 0,  tuition: 0, leveling: 0, position: 10)
DancePlan.create(name: 'Clase Privada.',lessons_per_week: 1,price: 15000.0,price_with_discount:10000.0,  tuition: 0, leveling: 0, position: 11)
DancePlan.create(name: 'Plan HobbyAmateur  Quinto Año',lessons_per_week: 2,price: 29000.0,price_with_discount:27000.0, tuition: 18000.0, leveling: 0, position: 5)
DancePlan.create(name: 'Plan HobbyAmateur 4 Veces por semana',lessons_per_week: 4,price: 42000.0,price_with_discount:40000.0, tuition: 18000.0, leveling: 0, position: 4)
DancePlan.create(name: 'Plan Profesional Nivelatorio', lessons_per_week: 0,price: 38000.0,price_with_discount: 0, tuition: 20000.0, leveling: 0, position: 9)
