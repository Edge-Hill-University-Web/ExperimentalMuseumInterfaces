export default ({
  env,
}: {
  env: (key: string, fallback?: unknown) => unknown;
}) => ({
  "users-permissions": {
    config: {
      jwtSecret: env("JWT_SECRET"),
    },
  },
});
