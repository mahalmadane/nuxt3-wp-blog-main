<script setup lang="ts">
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Autoplay, Pagination, Navigation } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/pagination'
import 'swiper/css/navigation'

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
  <div class="w-full relative mb-16" :style="{ height: 'calc(100vh - 64px)' }">
    <Swiper
      :modules="[Autoplay, Pagination, Navigation]"
      :slides-per-view="1"
      :loop="true"
      :autoplay="{ delay: 7000, disableOnInteraction: false }"
      speed="1500"
      pagination
      navigation
      class="w-full h-full"
    >
      <SwiperSlide v-for="(slide, index) in slides" :key="index">
        <div
          class="w-full h-full bg-center bg-cover relative flex items-center justify-center animated-bg"
          :style="`background-image: url(${slide.image})`"
        >
          <div class="absolute inset-0 bg-black/50"></div>
          <div class="relative z-10 text-center max-w-2xl px-4">
            <h2 class="text-5xl font-bold text-white mb-4 uppercase drop-shadow-lg">
              {{ slide.title }}
            </h2>
            <p class="text-xl text-white mb-6 drop-shadow-md">
              {{ slide.description }}
            </p>
            <NuxtLink
              :to="slide.link"
              class="bg-[#eab308] text-black px-8 py-3 rounded-lg font-semibold shadow hover:bg-[#d4a106] transition"
            >
              Détails
            </NuxtLink>
          </div>
        </div>
      </SwiperSlide>
    </Swiper>
  </div>
</template>

<style scoped>
@keyframes zoomInOut {
  0%, 100% {
    background-size: 110% 110%;
    background-position: center center;
  }
  50% {
    background-size: 100% 100%;
    background-position: center center;
  }
}

.animated-bg {
  background-size: 110% 110%;
  animation: zoomInOut 20s ease-in-out infinite;
}
</style>
