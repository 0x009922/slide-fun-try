<script lang="ts">
import Vue, { PropType } from 'vue';

export type SlideTransitionMode = 'forward' | 'backward';

export default Vue.extend({
  name: 'SlideTransition',
  functional: true,
  props: {
    mode: {
      type: String as PropType<SlideTransitionMode>,
      required: true,
    },
  },
  render(h, ctx) {
    return h('transition', {
      props: {
        name: `slide-${ctx.props.mode}-transition`,
      },
    }, ctx.children);
  },
});
</script>

<style lang="sass">
@mixin backward
  transform: translateX(-25%)
  filter: brightness(50%)

@mixin forward
  transform: translateX(100%)

$transition: all .5s cubic-bezier(0.87, 0, 0.13, 1)

.slide
  &-forward-transition
    &-enter-active,
    &-leave-active
      transition: $transition

    &-leave-active
      position: absolute
      width: 100%
      z-index: 0

    &-enter-active
      z-index: 1

    &-leave-to
      +backward

    &-enter
      +forward

  &-backward-transition
    &-enter-active,
    &-leave-active
      transition: $transition

    &-leave-active
      position: absolute
      width: 100%
      z-index: 1

    &-enter-active
      z-index: 0

    &-leave-to
      +forward

    &-enter
      +backward
</style>
