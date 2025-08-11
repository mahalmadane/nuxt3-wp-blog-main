<template>
  <section class="bg-teal-50 py-16 px-4 mb-16">
    <div class="max-w-7xl mx-auto grid grid-cols-1 sm:grid-cols-5 gap-8 text-center">
      <div
        v-for="stat in stats"
        :key="stat.label"
        class="p-6 bg-white rounded-lg shadow"
      >
        <p class="text-5xl font-extrabold text-teal-600">
          {{ displayNumbers[stat.label] }}
          <span v-if="stat.suffix" class="text-3xl align-top">{{ stat.suffix }}</span>
        </p>
        <p class="mt-2 text-lg font-semibold text-gray-700">{{ stat.label }}</p>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { reactive, onMounted } from 'vue'

const stats = [
  { value: 118, label: 'Agents formés' },
  { value: 17, label: 'Partenaires' },
  { value: 6, label: 'Applications' },
  { value: 586, label: 'Structures connectées' },
  { value: 10, label: 'Antennes régionales' },
]

// objet pour stocker les valeurs animées affichées
const displayNumbers = reactive<Record<string, number>>({})

// fonction d’animation compteur pour chaque stat
function animateCount(label: string, target: number, duration = 2000) {
  let startTimestamp: number | null = null
  const step = (timestamp: number) => {
    if (!startTimestamp) startTimestamp = timestamp
    const progress = Math.min((timestamp - startTimestamp) / duration, 1)
    displayNumbers[label] = Math.floor(progress * target)
    if (progress < 1) {
      requestAnimationFrame(step)
    } else {
      displayNumbers[label] = target
    }
  }
  requestAnimationFrame(step)
}

onMounted(() => {
  // Initialise tous à 0
  stats.forEach(stat => {
    displayNumbers[stat.label] = 0
    animateCount(stat.label, stat.value)
  })
})
</script>
