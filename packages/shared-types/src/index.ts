// Shared TypeScript types for the EMI monorepo.
// Content types are defined in full in Sprint 3.
// This file is a placeholder so the package resolves in Sprint 0.

export type Slug = string;

export type PublishStatus = "draft" | "in-review" | "published" | "archived";

export interface CMSBase {
  id: number;
  createdAt: string;
  updatedAt: string;
  publishedAt?: string | null;
}

// Content types will be added here in Sprint 3.
