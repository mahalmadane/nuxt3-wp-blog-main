<script lang="ts" setup>
import { ref, onMounted, onUnmounted, watch } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const isScrolled = ref(false)
const isMenuOpen = ref(false)

const navLinks = [
  { name: 'Accueil', path: '/' },
  { name: 'Catégories', path: '/categories' },
  { name: 'Application', path: '/application' },
  { name: 'Contact', path: '/contact' }
]

const handleScroll = () => {
  isScrolled.value = window.scrollY > 10
}

watch(() => route.path, () => {
  isMenuOpen.value = false
})

const onKeyDown = (e: KeyboardEvent) => {
  if (e.key === 'Escape') isMenuOpen.value = false
}

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll, { passive: true })
  document.addEventListener('keydown', onKeyDown)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
  document.removeEventListener('keydown', onKeyDown)
})
</script>

<template>
  <header 
    class="sticky top-0 z-50 w-full transition-all duration-300"
    :class="{
      'backdrop-blur-md bg-teal-600/95 shadow-lg': isScrolled,
      'bg-teal-600': !isScrolled
    }"
  >
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <div class="flex h-16 items-center justify-between">
        <!-- Logo -->
        <NuxtLink 
          to="/" 
          class="flex items-center space-x-3 focus:outline-none group"
          aria-label="Accueil"
        >
          <div class="flex-shrink-0 p-1 bg-white rounded-full shadow-sm">
            <img 
              class="h-8 w-auto" 
              src="/assets/images/logoAgetic.png" 
              alt="Logo AGETIC"
              loading="lazy"
            >
          </div>
          <span class="text-xl font-bold text-white group-hover:text-teal-100 transition-colors">
            AGETIC
          </span>
        </NuxtLink>

        <!-- Navigation desktop -->
        <nav class="hidden md:flex items-center space-x-6">
          <NuxtLink
            v-for="link in navLinks"
            :key="link.path"
            :to="link.path"
            class="relative px-3 py-2 text-white hover:text-teal-100 transition-colors text-sm font-medium"
            :class="{ 'font-semibold': route.path === link.path }"
          >
            {{ link.name }}
            <span 
              v-if="route.path === link.path"
              class="absolute left-1/2 bottom-1 h-0.5 bg-white w-4/5 -translate-x-1/2 animate-underline"
            />
          </NuxtLink>
          
          <a
            href="https://agetic.gouv.ml/"
            target="_blank"
            rel="noopener noreferrer"
            class="ml-2 inline-flex items-center rounded-lg px-4 py-2 text-sm font-medium text-white bg-white/10 hover:bg-white/20 border border-white/30 transition-all"
          >
            <Icon name="mdi:web" class="mr-1.5 h-4 w-4" />
            Site web
          </a>
        </nav>

        <!-- Bouton mobile burger/croix -->
        <button
          @click="toggleMenu"
          class="md:hidden p-2 rounded-md text-white hover:bg-white/10 focus:outline-none transition-colors"
          :aria-expanded="isMenuOpen.toString()"
          aria-label="Menu principal"
        >
          <div class="w-6 h-6 relative">
            <!-- Barre du milieu -->
            <span 
              class="block absolute h-0.5 w-6 bg-current transform transition duration-300 ease-in-out"
              :class="{
                'rotate-45 translate-y-0': isMenuOpen,
                '-translate-y-1.5': !isMenuOpen
              }"
            ></span>
            <!-- Barre du bas -->
            <span 
              class="block absolute h-0.5 w-6 bg-current transform transition duration-300 ease-in-out"
              :class="{
                '-rotate-45 translate-y-0': isMenuOpen,
                'translate-y-1.5': !isMenuOpen
              }"
            ></span>
          </div>
        </button>
      </div>
    </div>

    <!-- Bannière -->
    <div 
      class="transition-all duration-300 overflow-hidden"
      
    >
      <div class="mx-auto max-w-7xl px-4 py-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h1 class="text-xl font-bold text-white sm:text-2xl">
            Agence des Technologies de l'Information et de la Communication
          </h1>
          <p class="mt-1 text-sm text-teal-100 sm:text-base">
            Innovation numérique au service du développement du Mali
          </p>
        </div>
      </div>
    </div>

    <!-- Menu mobile -->
    <Transition
      enter-active-class="transition ease-out duration-200"
      enter-from-class="opacity-0 translate-y-1"
      enter-to-class="opacity-100 translate-y-0"
      leave-active-class="transition ease-in duration-150"
      leave-from-class="opacity-100 translate-y-0"
      leave-to-class="opacity-0 translate-y-1"
    >
      <div 
        v-show="isMenuOpen"
        class="md:hidden bg-teal-600/95 backdrop-blur-sm border-t border-teal-700/20"
      >
        <div class="px-4 py-3 space-y-2">
          <NuxtLink
            v-for="link in navLinks"
            :key="link.path"
            :to="link.path"
            class="block px-4 py-3 rounded-md text-white hover:bg-white/10 transition-colors"
            :class="{ 'bg-white/15': route.path === link.path }"
            @click="isMenuOpen = false"
          >
            {{ link.name }}
          </NuxtLink>
          
          <a
            href="https://agetic.gouv.ml/"
            target="_blank"
            rel="noopener noreferrer"
            class="block px-4 py-3 mt-2 text-white bg-white/10 hover:bg-white/20 border border-white/30 rounded-md transition-colors"
            @click="isMenuOpen = false"
          >
            <div class="flex items-center">
              <Icon name="mdi:web" class="mr-3 h-5 w-5" />
              <span>Site officiel</span>
            </div>
          </a>
        </div>
      </div>
    </Transition>
  </header>
</template>

<style scoped>
.animate-underline {
  animation: underline 0.3s ease-out forwards;
}

@keyframes underline {
  from { transform: translateX(-50%) scaleX(0) }
  to { transform: translateX(-50%) scaleX(1) }
}

button:focus-visible,
a:focus-visible {
  @apply outline-none ring-2 ring-white ring-offset-2 ring-offset-teal-600;
}
</style>