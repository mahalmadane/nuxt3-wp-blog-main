<script lang="ts" setup>
import { ref } from 'vue'

const applications = [
  {
    id: 1,
    name: "Plateforme e-Gouvernement",
    description: "Solution intégrée pour les services administratifs en ligne avec authentification sécurisée et signature électronique.",
    category: "Gouvernement numérique",
    logo: "/assets/images/apps/e-gov.png",
    link: "#",
    features: ["Gestion des documents", "Signature électronique", "Workflow automatisé"]
  },
  {
    id: 2,
    name: "mSanté Mali",
    description: "Application mobile pour le suivi médical, prise de rendez-vous et téléconsultation avec les professionnels de santé.",
    category: "Santé",
    logo: "/assets/images/apps/msante.png",
    link: "#",
    features: ["Carnet de santé", "Rendez-vous en ligne", "Alertes médicales"]
  },
  {
    id: 3,
    name: "EduMali",
    description: "Plateforme nationale d'apprentissage en ligne avec contenus pédagogiques pour tous les niveaux scolaires.",
    category: "Éducation",
    logo: "/assets/images/apps/edumali.png",
    link: "#",
    features: ["Cours en ligne", "Espace enseignant", "Suivi de progression"]
  }
]

const currentSlide = ref(0)

const nextSlide = () => {
  currentSlide.value = (currentSlide.value + 1) % applications.length
}

const prevSlide = () => {
  currentSlide.value = (currentSlide.value - 1 + applications.length) % applications.length
}

const goToSlide = (index: number) => {
  currentSlide.value = index
}
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Header sera inséré ici via le layout -->
    
    <main>
      <!-- Section À propos -->
      <section class="py-16 bg-white">
        <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div class="lg:grid lg:grid-cols-12 lg:gap-8">
            <div class="lg:col-span-6">
              <h2 class="text-3xl font-bold text-teal-600 sm:text-4xl">
                À propos de l'AGETIC
              </h2>
              <p class="mt-4 text-lg text-gray-600">
                L'Agence des Technologies de l'Information et de la Communication (AGETIC) est l'acteur clé de la transformation numérique au Mali, développant des solutions innovantes pour moderniser l'administration et servir les citoyens.
              </p>
              <div class="mt-8 space-y-6">
                <div class="flex items-start">
                  <div class="flex-shrink-0 bg-teal-50 rounded-md p-2">
                    <Icon name="mdi:rocket-launch-outline" class="h-6 w-6 text-teal-600" />
                  </div>
                  <div class="ml-4">
                    <h3 class="text-lg font-medium text-gray-900">Notre vision</h3>
                    <p class="mt-1 text-gray-600">
                      Faire du Mali un leader africain dans l'innovation numérique au service du développement.
                    </p>
                  </div>
                </div>
                <div class="flex items-start">
                  <div class="flex-shrink-0 bg-teal-50 rounded-md p-2">
                    <Icon name="mdi:shield-check-outline" class="h-6 w-6 text-teal-600" />
                  </div>
                  <div class="ml-4">
                    <h3 class="text-lg font-medium text-gray-900">Engagements</h3>
                    <p class="mt-1 text-gray-600">
                      Solutions sécurisées, accessibles à tous et respectueuses des données personnelles.
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="mt-12 lg:mt-0 lg:col-span-6">
              <div class="bg-teal-50 rounded-xl p-8 sm:p-10 lg:p-12">
                <img 
                  src="/assets/images/logoAgetic.png" 
                  alt="Transformation numérique au Mali" 
                  class="rounded-lg shadow-lg w-full h-auto object-cover"
                  loading="lazy"
                >
                <div class="mt-6 text-center">
                  <NuxtLink 
                    to="/about" 
                    class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-teal-600 hover:bg-teal-700 transition-colors"
                  >
                    Découvrir notre institution
                    <Icon name="mdi:arrow-right" class="ml-2 h-4 w-4" />
                  </NuxtLink>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Section Applications avec Slider -->
      <section class="py-16 bg-gray-50">
        <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div class="text-center">
            <h2 class="text-3xl font-bold text-teal-600 sm:text-4xl">
              Nos réalisations phares
            </h2>
            <p class="mt-4 text-lg text-gray-600 max-w-2xl mx-auto">
              Découvrez nos principales applications développées pour moderniser le Mali.
            </p>
          </div>

          <!-- Slider Container -->
          <div class="mt-12 relative">
            <!-- Slides -->
            <div class="relative overflow-hidden">
              <div class="flex transition-transform duration-300 ease-in-out"
                :style="{ transform: `translateX(-${currentSlide * 100}%)` }">
                <div v-for="(app, index) in applications" 
                     :key="app.id"
                     class="w-full flex-shrink-0 px-4">
                  <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                    <div class="md:flex">
                      <div class="md:w-1/2 bg-gray-100 flex items-center justify-center p-8">
                        <img 
                          :src="app.logo" 
                          :alt="`Logo ${app.name}`" 
                          class="max-h-64 object-contain"
                          loading="lazy"
                        >
                      </div>
                      <div class="md:w-1/2 p-8">
                        <div class="flex items-center">
                          <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-teal-100 text-teal-800">
                            {{ app.category }}
                          </span>
                        </div>
                        <h3 class="mt-4 text-2xl font-bold text-gray-900">
                          {{ app.name }}
                        </h3>
                        <p class="mt-4 text-gray-600">
                          {{ app.description }}
                        </p>
                        <div class="mt-6">
                          <h4 class="text-sm font-medium text-gray-900">Fonctionnalités clés :</h4>
                          <ul class="mt-2 space-y-2">
                            <li v-for="(feature, i) in app.features" :key="i" class="flex items-start">
                              <Icon name="mdi:check-circle-outline" class="flex-shrink-0 h-5 w-5 text-teal-500 mr-2" />
                              <span class="text-gray-600">{{ feature }}</span>
                            </li>
                          </ul>
                        </div>
                        <div class="mt-8">
                          <NuxtLink 
                            :to="app.link"
                            class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-teal-600 hover:bg-teal-700 transition-colors"
                          >
                            Voir le projet
                            <Icon name="mdi:arrow-right" class="ml-2 h-4 w-4" />
                          </NuxtLink>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Navigation Arrows -->
            <button @click="prevSlide" 
                    class="absolute left-0 top-1/2 -translate-y-1/2 -ml-4 p-2 rounded-full bg-white shadow-md text-teal-600 hover:bg-teal-50 transition-colors z-10"
                    aria-label="Projet précédent">
              <Icon name="mdi:chevron-left" class="h-6 w-6" />
            </button>
            <button @click="nextSlide" 
                    class="absolute right-0 top-1/2 -translate-y-1/2 -mr-4 p-2 rounded-full bg-white shadow-md text-teal-600 hover:bg-teal-50 transition-colors z-10"
                    aria-label="Projet suivant">
              <Icon name="mdi:chevron-right" class="h-6 w-6" />
            </button>

            <!-- Indicators -->
            <div class="flex justify-center mt-6 space-x-2">
              <button v-for="(_, index) in applications" 
                      :key="index"
                      @click="goToSlide(index)"
                      class="w-3 h-3 rounded-full transition-colors"
                      :class="{
                        'bg-teal-600 w-6': currentSlide === index,
                        'bg-gray-300': currentSlide !== index
                      }"
                      aria-label="Aller au projet"
              ></button>
            </div>
          </div>

          <!-- Call to action -->
          <div class="mt-16 text-center">
            <h3 class="text-2xl font-medium text-gray-900">Un projet numérique pour le Mali ?</h3>
            <p class="mt-4 text-lg text-gray-600 max-w-2xl mx-auto">
              Nous accompagnons les porteurs de projets dans la réalisation de solutions numériques innovantes.
            </p>
            <div class="mt-8">
              <NuxtLink 
                to="/contact" 
                class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-teal-600 hover:bg-teal-700 transition-colors"
              >
                Proposer un projet
                <Icon name="mdi:lightbulb-on-outline" class="ml-2 h-5 w-5" />
              </NuxtLink>
            </div>
          </div>
        </div>
      </section>
    </main>
  </div>
</template>

<style scoped>
/* Animation fluide pour le slider */
.slide-enter-active,
.slide-leave-active {
  transition: opacity 0.5s ease, transform 0.5s ease;
}

.slide-enter-from,
.slide-leave-to {
  opacity: 0;
  transform: translateX(30px);
}

/* Style pour les indicateurs */
.indicator {
  transition: width 0.3s ease, background-color 0.3s ease;
}
</style>