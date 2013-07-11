# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130611134356) do

  create_table "alimentos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cargos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contactos", :force => true do |t|
    t.string   "nombre"
    t.string   "celular"
    t.string   "email"
    t.string   "fecha_nacimiento"
    t.integer  "empresa_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "contactos", ["empresa_id"], :name => "index_contactos_on_empresa_id"

  create_table "cortesias", :force => true do |t|
    t.integer  "huesped_id"
    t.string   "tabla_de_queso"
    t.string   "botella_de_vino"
    t.integer  "alimento_id"
    t.string   "otro_regalo"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "cortesias", ["alimento_id"], :name => "index_cortesias_on_alimento_id"
  add_index "cortesias", ["huesped_id"], :name => "index_cortesias_on_huesped_id"

  create_table "departamentos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "empleados", :force => true do |t|
    t.integer  "cargo_id"
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "primer_apellido"
    t.string   "segundo_apellido"
    t.integer  "tiposdeidentificacion_id"
    t.string   "documento"
    t.integer  "departamento_id"
    t.string   "fecha_nacimiento"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "empleados", ["cargo_id"], :name => "index_empleados_on_cargo_id"
  add_index "empleados", ["departamento_id"], :name => "index_empleados_on_departamento_id"
  add_index "empleados", ["tiposdeidentificacion_id"], :name => "index_empleados_on_tiposdeidentificacion_id"

  create_table "empresas", :force => true do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "direccion"
    t.integer  "empleado_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "empresas", ["empleado_id"], :name => "index_empresas_on_empleado_id"

  create_table "huespedes", :force => true do |t|
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "primer_apellido"
    t.string   "segundo_apellido"
    t.integer  "tiposdeidentificacion_id"
    t.string   "documento"
    t.string   "fecha_nacimiento"
    t.string   "direccion"
    t.string   "email"
    t.integer  "empleado_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "huespedes", ["empleado_id"], :name => "index_huespedes_on_empleado_id"
  add_index "huespedes", ["tiposdeidentificacion_id"], :name => "index_huespedes_on_tiposdeidentificacion_id"

  create_table "preferencias", :force => true do |t|
    t.integer  "tiposdehabitacion_id"
    t.integer  "huesped_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "preferencias", ["huesped_id"], :name => "index_preferencias_on_huesped_id"
  add_index "preferencias", ["tiposdehabitacion_id"], :name => "index_preferencias_on_tiposdehabitacion_id"

  create_table "sugerenciasyquejas", :force => true do |t|
    t.integer  "huesped_id"
    t.text     "observaciones"
    t.text     "sugerencias"
    t.text     "problemas_en_la_estadia"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "sugerenciasyquejas", ["huesped_id"], :name => "index_sugerenciasyquejas_on_huesped_id"

  create_table "telefonos", :force => true do |t|
    t.integer  "huesped_id"
    t.string   "numero_telefonico"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "telefonos", ["huesped_id"], :name => "index_telefonos_on_huesped_id"

  create_table "telefonos1", :force => true do |t|
    t.integer  "empleado_id"
    t.string   "numero_telefonico"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "telefonos1", ["empleado_id"], :name => "index_telefonos1_on_empleado_id"

  create_table "tiposdehabitaciones", :force => true do |t|
    t.string   "tipo"
    t.text     "descripcion"
    t.text     "amenidades"
    t.string   "numero_de_habitacion"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "tiposdeidentificaciones", :force => true do |t|
    t.string   "descripcion"
    t.string   "sigla"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "visitas", :force => true do |t|
    t.integer  "obsequio_id"
    t.integer  "empleado_id"
    t.integer  "empresa_id"
    t.string   "fecha"
    t.text     "comentarios"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "visitas", ["empleado_id"], :name => "index_visitas_on_empleado_id"
  add_index "visitas", ["empresa_id"], :name => "index_visitas_on_empresa_id"
  add_index "visitas", ["obsequio_id"], :name => "index_visitas_on_obsequio_id"

end
