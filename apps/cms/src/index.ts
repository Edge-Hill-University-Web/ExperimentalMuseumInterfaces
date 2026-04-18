/**
 * Main Strapi lifecycle entry point.
 *
 * `register` runs before plugins are loaded — use it to extend the Strapi
 * container with custom services, controllers, or policies.
 *
 * `bootstrap` runs after all plugins are loaded — use it to seed data,
 * register custom cron jobs, or wire up event listeners.
 */
export default {
  register(/* { strapi }: { strapi: unknown } */) {
    // Reserved for Sprint 3+ — admin user seeding and content-type registration.
  },

  bootstrap(/* { strapi }: { strapi: unknown } */) {
    // Reserved for Sprint 3+ — content seeding and lifecycle hooks.
  },
};
