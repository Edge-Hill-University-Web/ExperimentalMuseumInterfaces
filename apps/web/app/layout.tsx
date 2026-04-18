import type { Metadata } from "next";
import "../styles/globals.css";

export const metadata: Metadata = {
  title: "Experimental Museum Interfaces",
  description:
    "Research into digital interfaces for cultural collections — Edge Hill University",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
