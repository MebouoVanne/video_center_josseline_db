<?php

namespace App\Controller;

use App\Entity\Video;
use App\Form\VideoType;
use App\Repository\VideoRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class VideoController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(
        VideoRepository $videoRepository, 
        Request $request,
        PaginatorInterface $paginator,): Response
    {

        $videos = $paginator->paginate(
            $videoRepository->findAll(),
            $request->query->getInt('page', 1),
            10
        );

    
        return $this->render('video/index.html.twig', [
        'videos'=>$videos,
            
        ]);
    }

    #[Route('/video/{id<[0-9]+>}', name: 'app_video_show', methods: 'GET')]
    public function show(Video $video): Response
    {
        return $this->render('video/show.html.twig', compact('video'));
    }

     #[Route('/video/create', name: 'app_video_create', methods:["GET","POST"])]
    public function create(
        Request $request,
        EntityManagerInterface $manager,
    ): Response
    {
            $video = new video;
            $form = $this->createForm(VideoType::class, $video);
            $form->handleRequest($request);
            if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($video);
            $manager->flush();
            $this->addFlash(
                'success',
                'Votre vidéo a été ajouter avec succès !'
            );
    
            return $this->redirectToRoute('app_home');
 }
 return $this->render('video/create.html.twig', ['form' => $form->createView()]); 
    }

    #[Route('/video/{id<[0-9]+>}/edit', name: 'app_video_edit', methods:["GET","POST"])]
    public function edit(
        Request $request,
        EntityManagerInterface $manager,
        Video $video
    ): Response
    {
            $form = $this->createForm(VideoType::class, $video);
            $form->handleRequest($request);
            if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($video);
            $manager->flush();

            $this->addFlash(
                'success',
                'Votre video a été modifier avec succès !'
            );
    
            return $this->redirectToRoute('app_home');
 }
 return $this->render('video/edit.html.twig', ['form' => $form->createView()]); 
    }

    #[Route('/video/{id<[0-9]+>}/delete', name: 'app_video_delete')]
    public function delete(
        EntityManagerInterface $manager,
        Video $video
    ): Response
    {
            $manager->remove($video);
            $manager->flush();
            $this->addFlash(
                'success',
                'Votre video a été supprimé avec succès !'
            );
    
            return $this->redirectToRoute('app_home');

    }
}
