<template>
  <div class="animated-message">
    <template v-for="({ color, char, animationDelay, animationDuration }, i) in charsWithColors">
      <div
        :key="i"
        :class="{
          [color]: true,
          'animated-message__char--empty': char === ' '
        }"
        :style="{
          animationDelay,
          animationDuration,
        }"
        class="animated-message__char display-1 font-weight-medium"
      >
        {{ char }}
      </div>
    </template>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import colors from 'vuetify/lib/util/colors';

type CharWithData = {
  char: string;
  color: string;
  animationDelay: string;
  animationDuration: string;
}

const COLORS = Object.keys(colors)
  // Убираю неяркие цвета
  .filter((x) => !['shades', 'grey'].includes(x))
  // camelCase -> kebab-case
  .map((s) => s.replace(/([A-Z])/, (sub) => `-${sub.toLowerCase()}`));

function pickRandomColor(): string {
  // eslint-disable-next-line no-bitwise
  const color = COLORS[~~(Math.random() * COLORS.length)];
  return `${color}--text`;
}

function pickRandomAnimationDelay(): string {
  const number = -Math.random() * 1.5;
  return `${number}s`;
}

function pickRandomAnimationDuration(): string {
  const number = 0.7 + Math.random() * 1.3;
  return `${number}s`;
}

export default Vue.extend({
  name: 'AnimatedMessage',
  props: {
    message: {
      type: String,
      required: true,
    },
  },
  computed: {
    chars(): Array<string> {
      return this.message.split('');
    },
    charsWithColors(): Array<CharWithData> {
      return this.chars.map((char: string) => ({
        char,
        color: pickRandomColor(),
        animationDelay: pickRandomAnimationDelay(),
        animationDuration: pickRandomAnimationDuration(),
      }));
    },
  },
});
</script>

<style lang="sass">
@use 'sass:math'

@keyframes char-jump
  $amp: -10px
  @for $i from 0 through 100
    $x: math.sin(($i / 100) * math.$pi) * $amp
    #{$i}%
      transform: translateY($x)

.animated-message
  display: flex
  align-items: center

  &__char
    display: inline-block
    // white-space: pre-wrap
    animation: char-jump .7s infinite linear

    &--empty
      // Пробел
      width: 10px
</style>
