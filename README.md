# README

1. Crear el proyecto zoo
	
	rails new Zoo -d postgresql

2. Crear el modelo animal_type con atributo nombre

	rails g model animal_type nombre

3. Crear el modelo animal con nombre y referencia a animal_type

	rails g model animal nombre animal_type:references

4. Revisar y correr las migraciones

	rails db:create
	rake db:migrate

5. Establecer la relación de 1 a N en ambos modelos

	class AnimalType < ApplicationRecord
		has_many :animals
	end

6. Validarlapresenciadelnombredeltipodeanimal
(reload! a la consola si estaba abierta)

	class AnimalType < ApplicationRecord
		has_many :animals
		validates :nombre, presence: true
	end

7. Instanciar un chango como tipo de animal

	m = AnimalType.new(nombre: "mono")

8. Ver si es válido

	2.4.0 :044 > m
 => #<AnimalType id: nil, nombre: "mono", created_at: nil, updated_at: nil>	

9. Guardar al chango
	
	AnimalType.new(nombre: "mono").save	

10. Instanciar un tipo de animal sin nombre

	2.4.0 :049 > m = AnimalType.new().valid?
 => false 	

11. Ver si es válido, ver los errores

		2.4.0 :049 > m = AnimalType.new().valid?
 => false 	

12. Crear a pancho, un animal del tipo chango
	at = AnimalType.find_by(nombre: "mono")
	at.animals.build(nombre: "pancho").save

	Animal.all
  Animal Load (0.5ms)  SELECT "animals".* FROM "animals"
 => #<ActiveRecord::Relation [#<Animal id: 1, nombre: "pancho", animal_type_id: 2, created_at: "2017-07-08 01:31:19", updated_at: "2017-07-08 01:31:19">