<script lang="ts" setup>
import { ref, onMounted, onUnmounted } from 'vue'

const applications = [
  {
    id: 1,
    name: "Plateforme e-Gouvernement",
    description: "Digitalisation des services administratifs maliens",
    category: "Administration",
    logo: "/assets/images/apps/e-gov.png"
  },
  {
    id: 2,
    name: "mSanté Mali",
    description: "Solution de santé mobile pour les citoyens",
    category: "Santé",
    logo: "/assets/images/apps/msante.png"
  },
  {
    id: 3,
    name: "EduMali",
    description: "Plateforme éducative nationale en ligne",
    category: "Éducation",
    logo: "/assets/images/apps/edumali.png"
  }
]

const currentSlide = ref(0)
let intervalId: NodeJS.Timeout

// Transition douce en boucle infinie
const nextSlide = () => {
  currentSlide.value = (currentSlide.value + 1) % applications.length
}

const goToSlide = (index: number) => {
  currentSlide.value = index
  resetInterval()
}

const startInterval = () => {
  intervalId = setInterval(nextSlide, 3000) // Rotation toutes les 3 secondes
}

const resetInterval = () => {
  clearInterval(intervalId)
  startInterval()
}

onMounted(() => {
  startInterval()
})

onUnmounted(() => {
  clearInterval(intervalId)
})
</script>

<template>
  <div class="bg-gray-50">
    <!-- Section À propos -->
    <section class="py-12 bg-white">
      <div class="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h2 class="text-2xl font-bold text-teal-600 sm:text-3xl">
            L'AGETIC en bref
          </h2>
          <div class="mt-6 max-w-3xl mx-auto">
            <p class="text-gray-600">
              L'Agence des Technologies de l'Information et de la Communication (AGETIC) est le fer de lance de la transformation numérique au Mali. 
              Nous concevons et déployons des solutions innovantes pour moderniser l'administration et servir les citoyens.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Section Applications -->
    <section class="py-12">
      <div class="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-10">
          <h2 class="text-2xl font-bold text-teal-600 sm:text-3xl">
            Nos applications phares
          </h2>
          <p class="mt-3 text-gray-600 max-w-2xl mx-auto">
            Découvrez nos solutions numériques au service du Mali
          </p>
        </div>

        <!-- Carrousel amélioré -->
        <div class="relative overflow-hidden">
          <!-- Conteneur des slides avec animation infinie -->
          <div class="flex transition-transform duration-700 ease-in-out"
            :style="{ transform: `translateX(-${currentSlide * 100}%)` }">
            <!-- Dupliquer les slides pour une boucle parfaite -->
            <div v-for="(app, index) in [...applications, ...applications]" 
                 :key="`${app.id}-${index}`"
                 class="w-full flex-shrink-0 px-3">
              <div class="bg-white rounded-lg shadow-sm p-5 h-full flex flex-col items-center text-center border border-gray-100">
                <div class="bg-gray-50 rounded-lg p-3 mb-4 h-28 flex items-center justify-center">
                  <img :src="app.logo" :alt="app.name" class="max-h-full max-w-full object-contain" loading="lazy">
                </div>
                <span class="inline-block px-2 py-1 text-xs font-medium text-teal-800 bg-teal-50 rounded-full mb-2">
                  {{ app.category }}
                </span>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">{{ app.name }}</h3>
                <p class="text-gray-600 text-sm mb-3">{{ app.description }}</p>
                <button class="mt-auto text-sm font-medium text-teal-600 hover:text-teal-500">
                  Découvrir →
                </button>
              </div>
            </div>
          </div>
          
          <!-- Indicateurs -->
          <div class="flex justify-center mt-6 space-x-1.5">
            <button v-for="(_, index) in applications" 
                    :key="index"
                    @click="goToSlide(index)"
                    @mouseenter="resetInterval"
                    @mouseleave="startInterval"
                    class="w-2 h-2 rounded-full transition-all duration-300"
                    :class="{
                      'bg-teal-600 w-4': currentSlide % applications.length === index,
                      'bg-gray-300': currentSlide % applications.length !== index
                    }"
                    aria-label="Aller au projet">
            </button>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
/* Animation fluide */
.transition-transform {
  transition-property: transform;
}

/* Optimisation de l'affichage */
.bg-gray-50 {
  background-color: #f9fafb;
}
</style>