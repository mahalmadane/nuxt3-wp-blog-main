<script lang="ts" setup>
const socialLinks = [
  { name: 'Facebook', icon: 'mdi:facebook', url: '#' },
  { name: 'Twitter', icon: 'mdi:twitter', url: '#' },
  { name: 'LinkedIn', icon: 'mdi:linkedin', url: '#' },
  { name: 'YouTube', icon: 'mdi:youtube', url: '#' }
]

const footerLinks = [
  {
    title: 'Navigation',
    links: [
      { name: 'Accueil', path: '/' },
      { name: 'Catégories', path: '/categories' },
      { name: 'Applications', path: '/application' },
      { name: 'Contact', path: '/contact' }
    ]
  },
  {
    title: 'Légal',
    links: [
      { name: 'Mentions légales', path: '/legal' },
      { name: 'Politique de confidentialité', path: '/privacy' },
      { name: 'Conditions d\'utilisation', path: '/terms' },
      { name: 'Accessibilité', path: '/accessibility' }
    ]
  }
]
</script>

<template>
  <footer class="bg-teal-700 text-white">
    <!-- Contenu principal du footer -->
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-12">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-10">
        <!-- Colonne Logo + Description -->
        <div class="space-y-6">
          <div class="flex items-center space-x-3">
            <div class="flex-shrink-0 p-1 bg-white rounded-full shadow-sm">
              <img 
                src="/assets/images/logoAgetic.png" 
                alt="Logo AGETIC" 
                class="h-10 w-auto"
                loading="lazy"
              >
            </div>
            <span class="text-xl font-bold">AGETIC</span>
          </div>
          <p class="text-teal-100 text-sm">
            L'Agence des Technologies de l'Information et de la Communication, moteur de la transformation numérique au Mali.
          </p>
          <div class="flex space-x-4">
            <a 
              v-for="social in socialLinks" 
              :key="social.name"
              :href="social.url"
              :aria-label="social.name"
              class="text-teal-200 hover:text-white transition-colors"
            >
              <Icon :name="social.icon" class="h-6 w-6" />
            </a>
          </div>
        </div>

        <!-- Liens rapides -->
        <div class="grid grid-cols-2 gap-8">
          <div v-for="(group, index) in footerLinks" :key="index">
            <h3 class="text-sm font-semibold uppercase tracking-wider text-teal-100">
              {{ group.title }}
            </h3>
            <ul class="mt-4 space-y-2">
              <li v-for="link in group.links" :key="link.name">
                <NuxtLink 
                  :to="link.path"
                  class="text-sm text-teal-100 hover:text-white transition-colors"
                >
                  {{ link.name }}
                </NuxtLink>
              </li>
            </ul>
          </div>
        </div>

        <!-- Contact -->
        <div>
          <h3 class="text-sm font-semibold uppercase tracking-wider text-teal-100">
            Contact
          </h3>
          <ul class="mt-4 space-y-3">
            <li class="flex items-start">
              <Icon name="mdi:map-marker" class="flex-shrink-0 h-5 w-5 text-teal-200 mt-0.5" />
              <span class="ml-2 text-sm text-teal-100">Avenue Modibo Keita, Bamako, Mali</span>
            </li>
            <li class="flex items-start">
              <Icon name="mdi:phone" class="flex-shrink-0 h-5 w-5 text-teal-200 mt-0.5" />
              <span class="ml-2 text-sm text-teal-100">+223 20 23 04 04</span>
            </li>
            <li class="flex items-start">
              <Icon name="mdi:email" class="flex-shrink-0 h-5 w-5 text-teal-200 mt-0.5" />
              <span class="ml-2 text-sm text-teal-100">info@agetic.gouv.ml</span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Copyright -->
    <div class="border-t border-teal-600 py-6">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <p class="text-xs text-teal-100 text-center">
          &copy; {{ new Date().getFullYear() }} AGETIC Mali. Tous droits réservés.
        </p>
      </div>
    </div>
  </footer>
</template>

<style scoped>
/* Animation des liens */
a {
  transition: color 0.2s ease;
}

/* Style pour les liens actifs dans la navigation */
.router-link-active {
  @apply text-white font-medium;
}
</style>