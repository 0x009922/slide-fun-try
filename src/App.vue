<template>
  <v-app>
    <v-main>
      <div class="fill-height d-flex align-center justify-center grey lighten-4">
        <v-card
          width="450px"
          height="600px"
          class="overflow-hidden"
        >
          <slide-transition
            :mode="slideTransitionMode"
          >
            <div
              v-if="!opened"
              key="1"
              class="fill-height d-flex flex-column overflow-hidden white"
            >
              <v-card-title>
                List title
              </v-card-title>

              <div class="flex-grow-1 overflow-auto">
                <v-list>
                  <template v-for="i in 15">
                    <v-list-item
                      :key="i"
                      @click="opened = true"
                    >
                      <v-list-item-content>
                        <v-list-item-title>
                          Item number {{ i }}
                        </v-list-item-title>
                      </v-list-item-content>
                    </v-list-item>
                  </template>
                </v-list>
              </div>
            </div>

            <div
              v-else
              key="2"
              class="white fill-height"
            >
              <v-toolbar flat>
                <v-btn
                  icon
                  @click="opened = false"
                >
                  <v-icon>mdi-arrow-left</v-icon>
                </v-btn>

                <v-toolbar-title>
                  Opened state
                </v-toolbar-title>
              </v-toolbar>

              <v-card
                class="ma-4"
                outlined
              >
                <v-subheader>
                  Read message!
                </v-subheader>

                <animated-message
                  class="pa-4"
                  message="Hello, world!"
                />
              </v-card>
            </div>
          </slide-transition>
        </v-card>
      </div>
    </v-main>
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue';
import SlideTransition, { SlideTransitionMode } from './components/SlideTransition.vue';
import AnimatedMessage from './components/AnimatedMessage.vue';

export default Vue.extend({
  name: 'App',
  components: {
    SlideTransition,
    AnimatedMessage,
  },
  data: () => ({
    opened: false,
  }),
  computed: {
    slideTransitionMode(): SlideTransitionMode {
      return this.opened
        ? 'forward'
        : 'backward';
    },
  },
});
</script>
