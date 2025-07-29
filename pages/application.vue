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
    <!-- Section À propos - Version Professionnelle -->
<section class="relative py-16 bg-white overflow-hidden">
  <div class="absolute inset-0 bg-gradient-to-b from-teal-50 to-white opacity-90"></div>
  
  <div class="relative mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
    <!-- En-tête avec icône décorative -->
    <div class="text-center">
      <div class="inline-flex items-center justify-center bg-teal-100/20 rounded-full p-4 mb-6">
        <svg class="h-10 w-10 text-teal-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M13 10V3L4 14h7v7l9-11h-7z" />
        </svg>
      </div>
      <h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl lg:text-5xl">
        <span class="block text-teal-600">L'AGETIC</span>
        <span class="block font-medium text-gray-600 mt-2 text-xl sm:text-2xl">Pionnière du numérique malien</span>
      </h2>
    </div>

    <!-- Contenu principal avec mise en page équilibrée -->
    <div class="mt-12 grid grid-cols-1 gap-12 lg:grid-cols-2 lg:gap-24 items-center">
      <!-- Texte descriptif -->
      <div class="prose prose-lg text-gray-600 max-w-none">
        <p>
          <span class="font-semibold text-teal-600">L'Agence des Technologies de l'Information et de la Communication (AGETIC)</span> 
          est l'institution phare du Mali pour l'innovation technologique au service du développement national.
        </p>
        
        <p class="mt-4">
          Créée pour <span class="text-gray-900 font-medium">accélérer la transformation digitale</span> du pays, 
          nous concevons des plateformes stratégiques qui impactent positivement :
        </p>
        
        <ul class="mt-6 space-y-3">
          <li class="flex items-start">
            <svg class="flex-shrink-0 h-5 w-5 text-teal-500 mt-0.5 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
            <span>L'administration publique (e-gouvernement)</span>
          </li>
          <li class="flex items-start">
            <svg class="flex-shrink-0 h-5 w-5 text-teal-500 mt-0.5 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
            <span>Les services aux citoyens (santé, éducation)</span>
          </li>
          <li class="flex items-start">
            <svg class="flex-shrink-0 h-5 w-5 text-teal-500 mt-0.5 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
            <span>L'économie numérique (startups, fintech)</span>
          </li>
        </ul>
        
        <p class="mt-6">
          Notre approche combine <span class="text-gray-900 font-medium">expertise technique</span>, 
          <span class="text-gray-900 font-medium">innovation locale</span> et 
          <span class="text-gray-900 font-medium">partenariats stratégiques</span>.
        </p>
      </div>

      <!-- Visuel accompagnateur -->
      <div class="relative">
        <div class="relative rounded-2xl shadow-xl overflow-hidden aspect-w-16 aspect-h-9">
          <img 
            src="/assets/images/logoAgetic.png" 
            alt="Siège de l'AGETIC à Bamako"
            class="object-cover w-full h-full"
            loading="lazy"
          >
          <div class="absolute inset-0 bg-gradient-to-t from-teal-600/20 to-transparent"></div>
        </div>
        
        <div class="mt-6 flex justify-center">
          <NuxtLink 
            to="/about" 
            class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-teal-600 hover:bg-teal-700 transition-colors duration-200"
          >
            Découvrir notre histoire
            <svg class="ml-3 -mr-1 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          </NuxtLink>
        </div>
      </div>
    </div>

    <!-- Chiffres clés -->
    <div class="mt-16 bg-teal-50 rounded-2xl p-8 sm:p-10">
      <div class="grid grid-cols-2 gap-8 md:grid-cols-4">
        <div class="text-center">
          <div class="text-3xl font-bold text-teal-600 sm:text-4xl">15+</div>
          <div class="mt-2 text-sm font-medium text-gray-600 uppercase tracking-wider">Applications</div>
        </div>
        <div class="text-center">
          <div class="text-3xl font-bold text-teal-600 sm:text-4xl">50+</div>
          <div class="mt-2 text-sm font-medium text-gray-600 uppercase tracking-wider">Experts</div>
        </div>
        <div class="text-center">
          <div class="text-3xl font-bold text-teal-600 sm:text-4xl">1M+</div>
          <div class="mt-2 text-sm font-medium text-gray-600 uppercase tracking-wider">Utilisateurs</div>
        </div>
        <div class="text-center">
          <div class="text-3xl font-bold text-teal-600 sm:text-4xl">24/7</div>
          <div class="mt-2 text-sm font-medium text-gray-600 uppercase tracking-wider">Support</div>
        </div>
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