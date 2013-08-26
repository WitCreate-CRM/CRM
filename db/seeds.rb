# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tiposdeidentificaciones = Tiposdeidentificacion.create([{descripcion: 'Cédula de ciudadania', sigla: 'C.C'}, {descripcion: 'Cédula extranjera', sigla: 'C.E'}, {descripcion: 'Tarjeta de identidad', sigla: 'T.I'}, {descripcion: 'Pasaporte', sigla: 'P.S'}])

users = User.create([{email: 'blsm@misena.edu.co', password: 'cuy', password_confirmation: 'cuy', username: 'blsm'}])


cargos = Cargo.create([{descripcion: 'Gerente'}, {descripcion: 'Mercadista'}])

departamentos = Departamento.create([{nombre: 'Mercadeo'}, {nombre: 'Calidad'}])
