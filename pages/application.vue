<script lang="ts" setup>
import { ref } from 'vue'

const applications = [
  {
    id: 1,
    name: "Plateforme e-Gouvernement",
    description: "Egesco » est une application web développée avec la technologie PHP combinée avec Oracle, servant au traitement des courriers arrivée et départ, qu'ils soient ordinaires ou confidentiels.",
    category: "Gestion de courriers",
    logo: "https://tse3.mm.bing.net/th/id/OIP.WTA-t9rQEWc0uCt4lfCNrAHaD-?rs=1&pid=ImgDetMain&o=7&rm=3",
    features: [
      "Signature électronique",
      "Workflow automatisé",
      "Gestion documentaire"
    ]
  },
  {
    id: 2,
    name: "AGIC",
    description: "AGIC est un Système d'Archivage Electronique (SAE) qui permet aux entreprises de contrôler la production, le stockage, la gestion et la distribution de documents électroniques.",
    category: "Archivage",
    logo: "https://tse2.mm.bing.net/th/id/OIP.t6A0XDHn-FKI1aTLRyhn7QAAAA?rs=1&pid=ImgDetMain&o=7&rm=3",
    features: [
      "Carnet de santé numérique",
      "Téléconsultation",
      "Alertes médicales"
    ]
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
    <!-- Section À propos -->
    <section class="py-16 bg-white">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <div class="inline-flex items-center justify-center bg-teal-100 rounded-full p-3 mb-6">
            <Icon name="mdi:government" class="h-8 w-8 text-teal-600" />
          </div>
          <h1 class="text-3xl font-bold text-teal-600 sm:text-4xl">
            L'AGETIC en action
          </h1>
          <p class="mt-4 text-lg text-gray-600 max-w-3xl mx-auto">
            Acteur majeur de la transformation numérique au Mali, l'AGETIC conçoit et déploie des solutions innovantes 
            pour moderniser l'administration et améliorer les services aux citoyens.
          </p>
        </div>

        <div class="mt-12 grid grid-cols-1 gap-8  md:grid-cols-3">
  <div   v-for="(feature, index) in [
    { title: 'Sécurité', text: 'Nos solutions garantissent la protection des données et la confidentialité' },
    { title: 'Innovation', text: 'Nous développons des technologies adaptées aux besoins locaux' },
    { title: 'Partenariats', text: 'Collaboration avec les acteurs publics et privés' }
  ]" :key="index" class=" p-6 rounded-xl  border border-gray-100 transition-all hover:shadow-lg hover:shadow-teal-500/70 shadow-md shadow-teal-500/50 bg-tea-200" >
    <div>
      <h3 class="text-2xl  text-teal-600 font-bold">{{ feature.title }}</h3>
      <p class="mt-1 text-gray-600">{{ feature.text }}</p>
    </div>
  </div>
</div>
      </div>
    </section>

    <!-- Section Applications -->
    <section class="py-16 bg-gray-50">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h2 class="text-2xl font-bold text-teal-600 sm:text-3xl">
            Nos réalisations phares
          </h2>
          <p class="mt-3 text-gray-600 max-w-2xl mx-auto">
            Découvrez nos principales applications développées pour moderniser le Mali
          </p>
        </div>

        <!-- Carrousel Manuel -->
        <div class="mt-12 relative">
          <!-- Conteneur des slides -->
          <div class="relative overflow-hidden rounded-2xl">
            <div class="flex transition-transform duration-500 ease-in-out"
              :style="{ transform: `translateX(-${currentSlide * 100}%)` }">
              <div 
                v-for="app in applications" 
                :key="app.id"
                class="w-full flex-shrink-0 px-4"
              >
                <div class="bg-white rounded-xl shadow-md overflow-hidden h-full">
                  <div class="md:flex h-full">
                    <!-- Partie Image -->
                    <div class="md:w-2/5 bg-gray-50 flex items-center justify-center p-8">
                      <img 
                        :src="app.logo" 
                        :alt="app.name" 
                        class="max-h-48 object-contain"
                        loading="lazy"
                      >
                    </div>
                    
                    <!-- Partie Contenu -->
                    <div class="md:w-3/5 p-8 flex flex-col justify-between">
                      <div>
                        <span class="inline-block px-3 py-1 text-xs font-semibold text-teal-800 bg-teal-100 rounded-full mb-3">
                          {{ app.category }}
                        </span>
                        <h3 class="text-xl font-bold text-gray-900">{{ app.name }}</h3>
                        <p class="mt-3 text-gray-600">{{ app.description }}</p>
                        
                        
                      </div>
                      
                      <div class="mt-8">
                        <button 
                          class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-teal-600 hover:bg-teal-700 transition-colors"
                        >
                          Voir le projet
                          <Icon name="mdi:arrow-right" class="ml-2 h-4 w-4" />
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Navigation -->
          <button 
            @click="prevSlide"
            class="absolute left-0 top-1/2 -translate-y-1/2 -ml-4 p-2 rounded-full bg-white shadow-md text-teal-600 hover:bg-teal-50 transition-colors z-10"
            aria-label="Projet précédent"
          >
            <Icon name="mdi:chevron-left" class="h-6 w-6" />
          </button>
          
          <button 
            @click="nextSlide"
            class="absolute right-0 top-1/2 -translate-y-1/2 -mr-4 p-2 rounded-full bg-white shadow-md text-teal-600 hover:bg-teal-50 transition-colors z-10"
            aria-label="Projet suivant"
          >
            <Icon name="mdi:chevron-right" class="h-6 w-6" />
          </button>

          <!-- Indicateurs -->
          <div class="flex justify-center mt-6 space-x-2">
            <button 
              v-for="(_, index) in applications" 
              :key="index"
              @click="goToSlide(index)"
              class="w-3 h-3 rounded-full transition-all duration-300"
              :class="{
                'bg-teal-600': currentSlide === index,
                'bg-gray-300': currentSlide !== index
              }"
              aria-label="Aller au projet"
            />
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

/* Style des cartes */
.rounded-xl {
  border-radius: 1rem;
}

/* Effet de survol amélioré */
button:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 128, 128, 0.2);
}
</style>