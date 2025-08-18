<template>
  <section class="max-w-7xl mx-auto py-8 px-4 mb-16">
    <div class="flex justify-center">
      <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-6">
        <div
          v-for="(img, index) in images"
          :key="index"
          class="w-[180px] h-[180px] rounded overflow-hidden shadow-lg bg-white"
        >
          <img
            :src="img"
            alt=""
            class="block w-full h-full object-cover"
            loading="lazy"
          />
        </div>
      </div>
    </div>
  </section>
</template>



<script setup lang="ts">
const images = [
  '/images/application/ats.jpeg',
  '/images/application/egesco.png',
  '/images/application/app.jpeg',
  '/images/application/famib.png',
  '/images/application/ml.png',
  '/images/application/femmeonu.png',
  '/images/application/amalan.png',
  '/images/application/agic.png',
]
</script>
