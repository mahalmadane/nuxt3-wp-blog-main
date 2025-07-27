<script lang="ts" setup>
import { ref, onMounted, onUnmounted } from 'vue'

const isScrolled = ref(false)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 10
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})
onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<template>
  <nav
    :class="[
      'text-white py-5 border-b sticky top-0 z-50 transition-all duration-300',
      isScrolled
        ? 'bg-[#008080]/80 backdrop-blur-md border-[#008080]'
        : 'bg-[#008080] border-transparent'
    ]"
  >
    <div
      class="container flex flex-col sm:flex-row justify-center gap-3 sm:gap-0 sm:justify-between items-center"
    >
      <NuxtLink to="/" class="text-2xl font-medium">Elon's Blog</NuxtLink>
      <ul class="nav">
        <li ><NuxtLink to="/">Home</NuxtLink></li>
        <li><NuxtLink to="/categories">Categories</NuxtLink></li>
      </ul>
    </div>
  </nav>
</template>

<style>
ul.nav {
  @apply flex gap-5 items-center justify-end;
}
ul.nav > li > a {
  @apply text-gray-300 hover:text-gray-50;
}
ul.nav > li > a.router-link-active {
  @apply text-primary-400;
}
</style>
