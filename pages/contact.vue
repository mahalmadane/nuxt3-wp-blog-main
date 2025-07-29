<script lang="ts" setup>
import { ref } from 'vue'

const form = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const isLoading = ref(false)
const isSuccess = ref(false)

const submitForm = () => {
  isLoading.value = true
  // Simuler un envoi de formulaire
  setTimeout(() => {
    isLoading.value = false
    isSuccess.value = true
    form.value = { name: '', email: '', subject: '', message: '' }
    setTimeout(() => isSuccess.value = false, 5000)
  }, 1500)
}
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Header sera inséré ici via le layout -->
    
    <main class="py-12 sm:py-16 lg:py-20">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <!-- En-tête de la page -->
        <div class="text-center mb-12">
          <h1 class="text-3xl font-bold text-teal-600 sm:text-4xl lg:text-5xl">
            Contactez-nous
          </h1>
          <p class="mt-4 text-lg text-gray-600 max-w-2xl mx-auto">
            Nous sommes à votre écoute pour répondre à toutes vos questions.
          </p>
        </div>

        <div class="bg-white shadow-xl rounded-2xl overflow-hidden">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-0">
            <!-- Formulaire de contact -->
            <div class="p-8 sm:p-10 lg:p-12">
              <form @submit.prevent="submitForm" class="space-y-6">
                <div>
                  <label for="name" class="block text-sm font-medium text-gray-700">Nom complet</label>
                  <input
                    type="text"
                    id="name"
                    v-model="form.name"
                    required
                    class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring-teal-500 p-3 border"
                  >
                </div>

                <div>
                  <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                  <input
                    type="email"
                    id="email"
                    v-model="form.email"
                    required
                    class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring-teal-500 p-3 border"
                  >
                </div>

                <div>
                  <label for="subject" class="block text-sm font-medium text-gray-700">Sujet</label>
                  <input
                    type="text"
                    id="subject"
                    v-model="form.subject"
                    required
                    class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring-teal-500 p-3 border"
                  >
                </div>

                <div>
                  <label for="message" class="block text-sm font-medium text-gray-700">Message</label>
                  <textarea
                    id="message"
                    rows="4"
                    v-model="form.message"
                    required
                    class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring-teal-500 p-3 border"
                  ></textarea>
                </div>

                <div>
                  <button
                    type="submit"
                    :disabled="isLoading"
                    class="w-full flex justify-center items-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-colors"
                    :class="{ 'opacity-70 cursor-not-allowed': isLoading }"
                  >
                    <span v-if="!isLoading">Envoyer le message</span>
                    <span v-else class="flex items-center">
                      <svg class="animate-spin -ml-1 mr-2 h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                      </svg>
                      Envoi en cours...
                    </span>
                  </button>
                </div>

                <!-- Message de succès -->
                <Transition
                  enter-active-class="transition ease-out duration-300"
                  enter-from-class="transform opacity-0 scale-95"
                  enter-to-class="transform opacity-100 scale-100"
                  leave-active-class="transition ease-in duration-200"
                  leave-from-class="transform opacity-100 scale-100"
                  leave-to-class="transform opacity-0 scale-95"
                >
                  <div v-if="isSuccess" class="rounded-md bg-green-50 p-4">
                    <div class="flex">
                      <div class="flex-shrink-0">
                        <svg class="h-5 w-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                        </svg>
                      </div>
                      <div class="ml-3">
                        <p class="text-sm font-medium text-green-800">
                          Votre message a bien été envoyé. Nous vous répondrons dans les plus brefs délais.
                        </p>
                      </div>
                    </div>
                  </div>
                </Transition>
              </form>
            </div>

            <!-- Informations de contact -->
            <div class="bg-teal-600 p-8 sm:p-10 lg:p-12 text-white">
              <div class="space-y-6">
                <h2 class="text-2xl font-bold">Nos coordonnées</h2>
                
                <div class="flex items-start space-x-4">
                  <div class="flex-shrink-0">
                    <svg class="h-6 w-6 text-teal-200" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                  </div>
                  <div>
                    <h3 class="text-sm font-medium text-teal-100">Adresse</h3>
                    <p class="mt-1 text-base">
                      Avenue de l'Indépendance<br>
                      Bamako, Mali
                    </p>
                  </div>
                </div>

                <!-- Carte Google Maps Responsive -->
                <div class="mt-4 rounded-lg overflow-hidden shadow-md">
                  <div class="aspect-w-16 aspect-h-9 w-full">
                    <iframe 
                      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3893.131068816455!2d-8.02356642545686!3d12.639405287646328!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xe51cd23fe1fd08b%3A0xa206c5ada0f8d7ac!2sAgetic!5e0!3m2!1sfr!2sus!4v1753813301932!5m2!1sfr!2sus" 
                      class="w-full h-64 sm:h-72 lg:h-80"
                      style="border:0;" 
                      allowfullscreen="" 
                      loading="lazy" 
                      referrerpolicy="no-referrer-when-downgrade"
                      title="Localisation de l'AGETIC sur Google Maps"
                    ></iframe>
                  </div>
                </div>

                <div class="flex items-start space-x-4">
                  <div class="flex-shrink-0">
                    <svg class="h-6 w-6 text-teal-200" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                    </svg>
                  </div>
                  <div>
                    <h3 class="text-sm font-medium text-teal-100">Téléphone</h3>
                    <p class="mt-1 text-base">
                      +223 20 23 04 04
                    </p>
                  </div>
                </div>

                <div class="flex items-start space-x-4">
                  <div class="flex-shrink-0">
                    <svg class="h-6 w-6 text-teal-200" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                    </svg>
                  </div>
                  <div>
                    <h3 class="text-sm font-medium text-teal-100">Email</h3>
                    <p class="mt-1 text-base">
                      info@agetic.gouv.ml
                    </p>
                  </div>
                </div>

                <div class="pt-6">
                  <h3 class="text-sm font-medium text-teal-100">Suivez-nous</h3>
                  <div class="mt-4 flex space-x-5">
                    <a href="#" class="text-teal-200 hover:text-white transition-colors">
                      <span class="sr-only">Facebook</span>
                      <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path fill-rule="evenodd" d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z" clip-rule="evenodd" />
                      </svg>
                    </a>
                    <a href="#" class="text-teal-200 hover:text-white transition-colors">
                      <span class="sr-only">Twitter</span>
                      <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
                      </svg>
                    </a>
                    <a href="#" class="text-teal-200 hover:text-white transition-colors">
                      <span class="sr-only">LinkedIn</span>
                      <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path fill-rule="evenodd" d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z" clip-rule="evenodd" />
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<style scoped>
/* Animation personnalisée pour le bouton */
button:focus-visible {
  @apply outline-none ring-2 ring-teal-500 ring-offset-2;
}

/* Style pour la carte */
.aspect-w-16 {
  position: relative;
  padding-bottom: 56.25%; /* Ratio 16:9 */
}

.aspect-w-16 iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

/* Transition pour les messages */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>