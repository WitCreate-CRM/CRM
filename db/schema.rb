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

ActiveRecord::Schema.define(:version => 20130429172150) do

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
    t.integer  "empresa_id_id"
    t.string   "nombre"
    t.string   "celular"
    t.string   "email"
    t.date     "fecha_nacimiento"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "contactos", ["empresa_id_id"], :name => "index_contactos_on_empresa_id_id"

  create_table "cortesias", :force => true do |t|
    t.integer  "huesped_id_id"
    t.string   "tabla_de_queso"
    t.string   "botella_de_vino"
    t.integer  "alimento_id_id"
    t.string   "otro_regalo"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "cortesias", ["alimento_id_id"], :name => "index_cortesias_on_alimento_id_id"
  add_index "cortesias", ["huesped_id_id"], :name => "index_cortesias_on_huesped_id_id"

  create_table "departamentos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "empleados", :force => true do |t|
    t.integer  "cargo_id_id"
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "primer_apellido"
    t.string   "segundo_apellido"
    t.integer  "tipo_identificacion_id_id"
    t.string   "documento"
    t.integer  "departamento_id_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "empleados", ["cargo_id_id"], :name => "index_empleados_on_cargo_id_id"
  add_index "empleados", ["departamento_id_id"], :name => "index_empleados_on_departamento_id_id"
  add_index "empleados", ["tipo_identificacion_id_id"], :name => "index_empleados_on_tipo_identificacion_id_id"

  create_table "empresas", :force => true do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "direccion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "huespedes", :force => true do |t|
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "primer_apellido"
    t.string   "segundo_apellido"
    t.integer  "tipo_identificacion_id_id"
    t.string   "documento"
    t.date     "fecha_nacimiento"
    t.string   "direccion"
    t.string   "email"
    t.integer  "empleado_encargado_id_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "huespedes", ["empleado_encargado_id_id"], :name => "index_huespedes_on_empleado_encargado_id_id"
  add_index "huespedes", ["tipo_identificacion_id_id"], :name => "index_huespedes_on_tipo_identificacion_id_id"

  create_table "obsequios", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "preferencias", :force => true do |t|
    t.integer  "tipo_habitacion_id_id"
    t.integer  "huesped_id_id"
    t.integer  "numero_almohada_en_cama"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "preferencias", ["huesped_id_id"], :name => "index_preferencias_on_huesped_id_id"
  add_index "preferencias", ["tipo_habitacion_id_id"], :name => "index_preferencias_on_tipo_habitacion_id_id"

  create_table "sugerenciasyquejas", :force => true do |t|
    t.integer  "huesped_id_id"
    t.text     "observaciones"
    t.text     "sugerencias"
    t.text     "problemas_en_la_estadia"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "sugerenciasyquejas", ["huesped_id_id"], :name => "index_sugerenciasyquejas_on_huesped_id_id"

  create_table "telefonos", :force => true do |t|
    t.integer  "propietario_id_id"
    t.string   "numero_telefonico"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "telefonos", ["propietario_id_id"], :name => "index_telefonos_on_propietario_id_id"

  create_table "tiposdehabitaciones", :force => true do |t|
    t.string   "descripcion"
    t.integer  "piso"
    t.boolean  "habitacion_tina"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "tiposdeidentificaciones", :force => true do |t|
    t.string   "descripcion"
    t.string   "sigla"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "visitas", :force => true do |t|
    t.integer  "obsequio_id_id"
    t.integer  "empleado_id_id"
    t.integer  "empresa_id_id"
    t.date     "fecha"
    t.text     "comentarios"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "visitas", ["empleado_id_id"], :name => "index_visitas_on_empleado_id_id"
  add_index "visitas", ["empresa_id_id"], :name => "index_visitas_on_empresa_id_id"
  add_index "visitas", ["obsequio_id_id"], :name => "index_visitas_on_obsequio_id_id"

end
