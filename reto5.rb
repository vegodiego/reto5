class Jugadores
	def adivinar(defEspec,respEspec)
		puts
		puts "definicion"
		puts
		puts defEspec
		puts
		entradaValida = false
		while entradaValida == false
			print "Adivinar: "
			adivinar = gets.chomp
			if adivinar == respEspec
				entradaValida = true
				puts
				puts "Correcto!"
			else
				puts
				puts "Incorrecto!, Trata de nuevo"
				puts
			end
		end
	end

	def jugar(listaDefin,listaResp)
		puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
		contador = 0
		listaDefin.each do |i|
			self.adivinar(i,listaResp[contador])
			contador+=1
		end
		puts
		puts "Juego finalizado"
	end
end

class Respuestas
	attr_accessor :resp

	def initialize(resp)
		@resp = resp.map {|i| i.gsub(" (Respuesta)","")}
	end
end

class Definiciones
	attr_accessor :defin

	def initialize(defin)
		@defin = defin.map {|i| i.gsub(" (Definicion)","")}
	end
end


listaDefiniciones = Definiciones.new(File.read("definiciones.txt").split("\n").select{|i| i.include? "Definicion"})
listaRespuestas = Respuestas.new(File.read("definiciones.txt").split("\n").select{|i| i.include? "Respuesta"})
jugador = Jugadores.new
jugador.jugar(listaDefiniciones.defin,listaRespuestas.resp)


