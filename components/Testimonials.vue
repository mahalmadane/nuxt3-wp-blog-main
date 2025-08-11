<script setup lang="ts">
const testimonials = [
  {
    author: 'Mme Fatoumata Diallo',
    role: 'Agent public',
    quote: 'L’AGETIC a transformé la manière dont je travaille grâce à ses formations innovantes.'
  },
  {
    author: 'M. Ibrahim Traoré',
    role: 'Responsable IT',
    quote: 'Les solutions développées ont modernisé notre administration en profondeur.'
  },
  {
    author: 'Mme Aminata Coulibaly',
    role: 'Consultante numérique',
    quote: 'Une vraie référence dans le domaine des TIC au Mali.'
  }
]
</script>

<template>
  <section class="bg-white py-16 px-4 max-w-7xl mx-auto mb-16">
    <h2 class="text-3xl font-bold text-center mb-12">Témoignages</h2>
    <div class="grid gap-8 md:grid-cols-3">
      <blockquote
        v-for="item in testimonials"
        :key="item.author"
        class="border-l-4 border-teal-600 pl-6 italic text-gray-700 shadow-sm rounded bg-teal-50 p-6"
      >
        <p>“{{ item.quote }}”</p>
        <footer class="mt-4 text-right font-semibold text-teal-800">
          — {{ item.author }}, <span class="font-normal">{{ item.role }}</span>
        </footer>
      </blockquote>
    </div>
  </section>
</template>
