<?php

namespace App\Entity;

use App\Entity\Traits\Timestampable;
use App\Repository\VideoRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: VideoRepository::class)]
#[ORM\Table(name: "videos")]
#[ORM\HasLifecycleCallbacks]

class Video
{

    use Timestampable;
    
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    #[Assert\NotBlank(message:"Veuillez entrer un titre")]
    #[Assert\Length(min: 3, minMessage:"vous devez entrer au minimun 3 caractères")]
    #[Assert\NotIdenticalTo(value: "merde")]
    private ?string $title = null;

    #[ORM\Column(length: 500)]
    private ?string $videoLink = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Assert\NotBlank(message:"Veuillez entrer une description")]
    #[Assert\Length(min: 20,minMessage:"vous devez entrer au minimun 20 caractères")]
    #[Assert\NotIdenticalTo(value:"wesh")]
    private ?string $description = null;

    #[ORM\ManyToOne(inversedBy: 'videos')]
    private ?User $user = null;

    #[ORM\Column]
    private ?bool $isPremiumVideo = null;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getVideoLink(): ?string
    {
        return $this->videoLink;
    }

    public function setVideoLink(string $videoLink): static
    {
        $this->videoLink = $videoLink;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    public function isIsPremiumVideo(): ?bool
    {
        return $this->isPremiumVideo;
    }

    public function setIsPremiumVideo(bool $isPremiumVideo): static
    {
        $this->isPremiumVideo = $isPremiumVideo;

        return $this;
    }

}
