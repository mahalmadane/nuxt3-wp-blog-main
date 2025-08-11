<script setup lang="ts">
const cards = [
  {
    image: '/images/cooperation.jpeg',
    title: 'Cooperation',
    description: 'Modernisation des services publics pour une meilleure efficacité.'
  },
  {
    image: '/images/formation.jpeg',
    title: 'Formation',
    description: 'Renforcement des compétences des agents dans le domaine numérique.'
  },
  {
    image: '/images/strategie.jpeg',
    title: 'Strategie Nationale',
    description: 'Création de solutions web et mobiles adaptées aux besoins du Mali.'
  },
  {
    image: '/images/infra.jpeg',
    title: 'Infrastructure',
    description: 'Protection des infrastructures et des données contre les cybermenaces.'
  }
]
</script>

<template>
  <section class="bg-teal-700 text-white py-20 px-6 md:px-12 mb-16">
    <div class="max-w-7xl mx-auto text-center mb-16">
      <h2 class="text-4xl font-bold mb-4">Agence des Technologies de l'Information et de la Communication</h2>
      <p class="text-lg max-w-3xl mx-auto">
        Innovation numérique au service du développement du Mali. Nous œuvrons pour moderniser l’administration publique à travers les technologies digitales, 
        renforcer les compétences et sécuriser les systèmes d’information.
      </p>
    </div>

    <div class="grid gap-12 md:grid-cols-4">
      <div
        v-for="card in cards"
        :key="card.title"
        class="bg-teal-600 rounded-lg shadow-lg p-6 flex flex-col items-center text-center hover:bg-teal-500 transition"
      >
        <img 
          :src="card.image" 
          alt="" 
          class="w-20 h-20 object-cover rounded-full mb-4"
          loading="lazy"
        />
        <h3 class="text-xl font-semibold mb-2">{{ card.title }}</h3>
        <p class="text-sm">{{ card.description }}</p>
      </div>
    </div>
  </section>
</template>
