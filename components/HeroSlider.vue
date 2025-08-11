<script setup lang="ts">
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Autoplay, Pagination, Navigation } from 'swiper/modules'

// Styles Swiper
import 'swiper/css'
import 'swiper/css/pagination'
import 'swiper/css/navigation'

// Slides personnalisés
const slides = [
  {
    image: '/images/informatisation.jpg',
    title: 'INFORMATISATION',
    description: "Modernisation de l'Administration publique à travers les TIC",
    link: '/details/informatisation'
  },
  {
    image: '/images/webmob.jpeg',
    title: 'APPLICATION WEB ET MOBILE',
    description: 'Conception de site web et développement d’applications web et mobiles.',
    link: '/details/applications'
  },
  {
    image: '/images/cyber-security.jpg',
    title: 'FORMATION',
    description: 'Renforcement des capacités des agents de l’administration publique.',
    link: '/details/formation'
  }
]
</script>

<template>
  <div class="w-full h-[500px] relative">
    <Swiper
      :modules="[Autoplay, Pagination, Navigation]"
      :slides-per-view="1"
      :loop="true"
      :autoplay="{ delay: 5000, disableOnInteraction: false }"
      pagination
      navigation
      class="w-full h-full"
    >
      <SwiperSlide v-for="(slide, index) in slides" :key="index">
        <!-- Image de fond -->
        <div
          class="w-full h-screen bg-center bg-cover relative flex items-center justify-center"
          :style="`background-image: url(${slide.image})`"
        >
          <!-- Overlay sombre -->
          <div class="absolute inset-0 bg-black/50"></div>

          <!-- Contenu -->
          <div class="relative z-10 text-center max-w-2xl px-4">
            <h2 class="text-4xl font-bold text-white mb-4 uppercase">
              {{ slide.title }}
            </h2>
            <p class="text-lg text-white mb-6">
              {{ slide.description }}
            </p>
            <NuxtLink
              :to="slide.link"
              class="bg-[#eab308] text-black px-6 py-3 rounded-lg font-semibold shadow hover:bg-[#d4a106] transition"
            >
              Détails
            </NuxtLink>
          </div>
        </div>
      </SwiperSlide>
    </Swiper>
  </div>
</template>
