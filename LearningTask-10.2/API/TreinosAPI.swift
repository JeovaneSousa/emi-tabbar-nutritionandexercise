//
//  TreinoAPI.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 04/08/2022.
//

import Foundation

class TreinosAPI {
    
    func carregaTodos() -> [Treino] {
        let exerciciosPull = [
            Exercicio(simbolo: "P", nome: "Puxada na polia", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "A", nome: "Puxador articulado", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "P", nome: "Puxada supinada na polia", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "R", nome: "Remada baixa com triângulo", descricao: "4x 12 repetições"),

            Exercicio(simbolo: "S", nome: "Rosca Scott com barra W", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "A", nome: "Rosca direta com barra", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "C", nome: "Rosca corda na polia baixa", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "P", nome: "Rosca de punho com barra", descricao: "4x 12 repetições"),
        ]

        let exerciciosPush = [
            Exercicio(simbolo: "S", nome: "Supino inclinado com dumbbell", descricao: "4x 12 + 8 repetições"),
            Exercicio(simbolo: "S", nome: "Supino reto com dumbbell", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "C", nome: "Crucifixo reto com dumbbell", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "C", nome: "Crucifixo crossover polia alta", descricao: "4x 12 repetições"),

            Exercicio(simbolo: "T", nome: "Tríceps testa na barra W", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "F", nome: "Tríceps francês com dumbbell", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "C", nome: "Tríceps corda na polia", descricao: "4x 12 repetições"),
        ]

        let exerciciosLeg = [
            Exercicio(simbolo: "🏋🏻", nome: "Agachamento Smith", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "A", nome: "Agachamento afundo dumbbell", descricao: "3x 15 repetições"),
            Exercicio(simbolo: "P", nome: "Leg press horizontal", descricao: "4x 12 repetições"),
            Exercicio(simbolo: "L", nome: "Extensão lombar", descricao: "3x 15 repetições"),
            Exercicio(simbolo: "F", nome: "Mesa flexora", descricao: "3x 15 repetições"),
            Exercicio(simbolo: "P", nome: "Elevação panturrilha Smith", descricao: "4x 12 repetições"),

            Exercicio(simbolo: "D", nome: "Desenvolvimento de ombros", descricao: "3x 12 repetições"),
            Exercicio(simbolo: "E", nome: "Elevação lateral de ombros", descricao: "3x 12 repetições"),
            Exercicio(simbolo: "C", nome: "Crucifixo invertido", descricao: "3x 12 repetições"),

            Exercicio(simbolo: "A", nome: "Abdominal reto máquina", descricao: "3x 12 repetições"),
            Exercicio(simbolo: "P", nome: "Prancha abdominal", descricao: "3x 1 minuto"),
        ]

        let exerciciosOff = [
            Exercicio(simbolo: "🧘🏻‍♂️", nome: "Meditação", descricao: "Descanso e relaxamento"),
        ]

        return [
            Treino(simbolo: "💪🏻", titulo: "Superiores - Pull", descricao: "Costas, bíceps e antebraços", exercicios: exerciciosPull),
            Treino(simbolo: "💪🏻", titulo: "Superiores - Push", descricao: "Peitorais e tríceps", exercicios: exerciciosPush),
            Treino(simbolo: "💪🏻", titulo: "Inferiores e Complementares", descricao: "Pernas, ombros e abdomen", exercicios: exerciciosLeg),
            Treino(simbolo: "💆🏻", titulo: "Off", descricao: "Dia de descanso", exercicios: exerciciosOff),
        ]
    }
    
}
